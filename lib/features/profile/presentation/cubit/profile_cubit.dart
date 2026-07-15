import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/features/profile/data/local_profile_store.dart';
import 'package:trendiva/features/profile/domain/repos/profile_repository.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repository) : super(const ProfileInitial());

  final ProfileRepository _repository;
  String? _userId;

  Future<void> loadProfile() async {
    emit(const ProfileLoading());
    try {
      final user = await _repository.getCurrentUser();
      _userId = user.userId;

      final photo = await LocalProfileStore.loadPhoto(user.userId);

      emit(ProfileLoaded(name: user.fullName, email: user.email, photo: photo));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
  }) async {
    final userId = _userId;
    final current = state;
    if (userId == null || current is! ProfileLoaded) return;

    await LocalProfileStore.saveName(userId, name);
    await LocalProfileStore.saveEmail(userId, email);

    emit(ProfileLoaded(name: name, email: email, photo: current.photo));
  }

  Future<void> updatePhoto(File newPhoto) async {
    final userId = _userId;
    final current = state;
    if (userId == null || current is! ProfileLoaded) return;

    final saved = await LocalProfileStore.savePhoto(userId, newPhoto);
    emit(ProfileLoaded(name: current.name, email: current.email, photo: saved));
  }
}
