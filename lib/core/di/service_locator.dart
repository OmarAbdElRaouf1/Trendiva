import 'package:get_it/get_it.dart';
import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/dio_client.dart';
import 'package:trendiva/features/auth/data/repos/auth_repository.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
}
