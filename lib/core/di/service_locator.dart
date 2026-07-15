import 'package:get_it/get_it.dart';
import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/dio_client.dart';
import 'package:trendiva/core/theme/theme_cubit.dart';
import 'package:trendiva/features/auth/data/repos/auth_repository_impl.dart';
import 'package:trendiva/features/auth/domain/repos/auth_repository.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trendiva/features/cart/data/repos/cart_repository_impl.dart';
import 'package:trendiva/features/cart/domain/repos/cart_repository.dart';
import 'package:trendiva/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:trendiva/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:trendiva/features/home/data/repos/categories_repository_impl.dart';
import 'package:trendiva/features/home/data/repos/offers_repository_impl.dart';
import 'package:trendiva/features/home/data/repos/products_repository_impl.dart';
import 'package:trendiva/features/home/domain/repos/categories_repository.dart';
import 'package:trendiva/features/home/domain/repos/offers_repository.dart';
import 'package:trendiva/features/home/domain/repos/products_repository.dart';
import 'package:trendiva/features/home/presentation/cubit/home_cubit.dart';
import 'package:trendiva/features/product_details/data/repos/reviews_repository_impl.dart';
import 'package:trendiva/features/product_details/domain/repos/reviews_repository.dart';
import 'package:trendiva/features/profile/data/repos/profile_repository_impl.dart';
import 'package:trendiva/features/profile/domain/repos/profile_repository.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  sl.registerSingleton<ThemeCubit>(
    ThemeCubit(await ThemeCubit.loadSavedMode()),
  );

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));

  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<OffersRepository>(() => OffersRepositoryImpl(sl()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl(), sl(), sl()));
  sl.registerFactory<CategoriesCubit>(() => CategoriesCubit(sl()));

  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));
  sl.registerFactory<CartCubit>(() => CartCubit(sl()));

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));

  sl.registerLazySingleton<ReviewsRepository>(
    () => ReviewsRepositoryImpl(sl()),
  );
}
