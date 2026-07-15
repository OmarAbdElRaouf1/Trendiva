import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/profile/data/models/user_model.dart';
import 'package:trendiva/features/profile/domain/entities/user_entity.dart';
import 'package:trendiva/features/profile/domain/repos/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<UserEntity> getCurrentUser() async {
    final response = await _apiService.get(EndPoints.me);
    return UserModel.fromJson(response as Map<String, dynamic>);
  }
}
