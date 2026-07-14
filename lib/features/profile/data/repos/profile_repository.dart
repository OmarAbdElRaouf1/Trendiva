import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/profile/data/models/user_model.dart';

class ProfileRepository {
  ProfileRepository(this._apiService);

  final ApiService _apiService;

  Future<UserModel> getCurrentUser() async {
    final response = await _apiService.get(EndPoints.me);
    return UserModel.fromJson(response as Map<String, dynamic>);
  }
}
