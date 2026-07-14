import 'dart:async';

import 'package:dio/dio.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/core/routing/navigation_service.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/utils/pref_helper.dart';

class DioClient {
  static const String _baseUrl = 'https://accessories-eshop.runasp.net';

  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  final Dio _refreshDio = Dio(BaseOptions(baseUrl: _baseUrl));

  bool _isRefreshing = false;
  Completer<String?>? _refreshCompleter;

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelper.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          final path = error.requestOptions.path;
          final isAuthEndpoint =
              path == EndPoints.login || path == EndPoints.refreshToken;

          if (error.response?.statusCode == 401 && !isAuthEndpoint) {
            final newToken = await _refreshAccessToken();
            if (newToken != null) {
              try {
                final retryOptions = error.requestOptions;
                retryOptions.headers['Authorization'] = 'Bearer $newToken';
                final response = await _dio.fetch(retryOptions);
                return handler.resolve(response);
              } catch (_) {
                return handler.next(error);
              }
            }
          }
          return handler.next(error);
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
      if (refreshToken == null || refreshToken.isEmpty) return null;

      final response = await _refreshDio.post(
        EndPoints.refreshToken,
        data: {'refreshToken': refreshToken, 'useCookies': false},
        options: Options(contentType: 'application/json'),
      );
      final data = response.data as Map<String, dynamic>;
      final newAccessToken = data['accessToken'] as String;
      final newRefreshToken = data['refreshToken'] as String;

      await PrefHelper.saveToken(newAccessToken);
      await PrefHelper.saveRefreshToken(newRefreshToken);
      return newAccessToken;
    } catch (_) {
      await PrefHelper.clearToken();
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        Routes.loginView,
        (route) => false,
      );
      return null;
    }
  }

  Dio get dio => _dio;
}
