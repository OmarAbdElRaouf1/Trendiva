import 'package:dio/dio.dart';

import 'package:trendiva/core/network/dio_client.dart';

import 'api_exceptions.dart';

class ApiService {
  ApiService(this._dioClient);

  final DioClient _dioClient;
  //Get Method
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dioClient.dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      rethrow;
    }
  }

  //Post Method
  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.post(
        endpoint,
        data: body,
        options: Options(contentType: 'application/json'),
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      rethrow;
    }
  }

  //Put Method
  Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.put(
        endpoint,
        data: body,
        options: Options(contentType: 'application/json'),
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      rethrow;
    }
  }

  //Delete Method
  Future<dynamic> delete(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.delete(
        endpoint,
        data: body,
        options: Options(contentType: 'application/json'),
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      rethrow;
    }
  }
}
