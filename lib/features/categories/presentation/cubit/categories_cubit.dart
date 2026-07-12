import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/features/categories/presentation/cubit/categories_state.dart';
import 'package:trendiva/features/home/data/repos/categories_repository.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._repository) : super(const CategoriesInitial());

  final CategoriesRepository _repository;

  Future<void> loadCategories() async {
    emit(const CategoriesLoading());
    try {
      final categories = await _repository.getCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
