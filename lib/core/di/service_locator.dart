import 'package:get_it/get_it.dart';
import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/dio_client.dart';
import 'package:trendiva/features/auth/data/repos/auth_repository.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trendiva/features/cart/data/repos/cart_repository.dart';
import 'package:trendiva/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:trendiva/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:trendiva/features/home/data/repos/categories_repository.dart';
import 'package:trendiva/features/home/data/repos/offers_repository.dart';
import 'package:trendiva/features/home/data/repos/products_repository.dart';
import 'package:trendiva/features/home/presentation/cubit/home_cubit.dart';
import 'package:trendiva/features/profile/data/repos/profile_repository.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));

  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepository(sl()));
  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepository(sl()),
  );
  sl.registerLazySingleton<OffersRepository>(() => OffersRepository(sl()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl(), sl(), sl()));
  sl.registerFactory<CategoriesCubit>(() => CategoriesCubit(sl()));

  sl.registerLazySingleton<CartRepository>(() => CartRepository(sl()));
  sl.registerFactory<CartCubit>(() => CartCubit(sl()));

  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepository(sl()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));
}
