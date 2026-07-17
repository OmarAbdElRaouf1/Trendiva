import 'dart:async';

import 'package:dio/dio.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/core/routing/navigation_service.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/utils/pref_helper.dart';

class DioClient {
  static const _baseUrl = 'https://accessories-eshop.runasp.net';

  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  final Dio _refreshDio = Dio(BaseOptions(baseUrl: _baseUrl));

  bool _isRefreshing = false;
  Completer<String?>? _refreshCompleter;

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelper.getToken();

          if (token?.isNotEmpty ?? false) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
        onError: (error, handler) async {
          final path = error.requestOptions.path;

          if (error.response?.statusCode == 401 &&
              path != EndPoints.login &&
              path != EndPoints.refreshToken) {
            final token = await _refreshAccessToken();

            if (token != null) {
              error.requestOptions.headers['Authorization'] = 'Bearer $token';

              final response = await _dio.fetch(error.requestOptions);
              return handler.resolve(response);
            }
          }

          handler.next(error);
        },
      ),
    );
  }

  Future<String?> _refreshAccessToken() {
    if (_isRefreshing) return _refreshCompleter!.future;

    _isRefreshing = true;
    _refreshCompleter = Completer<String?>();

    _doRefresh().then(_refreshCompleter!.complete).whenComplete(() {
      _isRefreshing = false;
    });

    return _refreshCompleter!.future;
  }

  Future<String?> _doRefresh() async {
    try {
      final refreshToken = await PrefHelper.getRefreshToken();

      if (refreshToken?.isEmpty ?? true) return null;

      final response = await _refreshDio.post(
        EndPoints.refreshToken,
        data: {'refreshToken': refreshToken, 'useCookies': false},
        options: Options(contentType: Headers.jsonContentType),
      );

      final data = response.data as Map<String, dynamic>;

      await PrefHelper.saveToken(data['accessToken']);
      await PrefHelper.saveRefreshToken(data['refreshToken']);

      return data['accessToken'];
    } catch (_) {
      await PrefHelper.clearToken();

      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        Routes.loginView,
        (_) => false,
      );

      return null;
    }
  }

  Dio get dio => _dio;
}
