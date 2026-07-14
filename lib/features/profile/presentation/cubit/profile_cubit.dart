import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/features/profile/data/local_profile_store.dart';
import 'package:trendiva/features/profile/data/repos/profile_repository.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repository) : super(const ProfileInitial());

  final ProfileRepository _repository;

  Future<void> loadProfile() async {
    emit(const ProfileLoading());
    try {
      final user = await _repository.getCurrentUser();
      final localName = await LocalProfileStore.loadName();
      final localEmail = await LocalProfileStore.loadEmail();
      final photo = await LocalProfileStore.loadPhoto();

      emit(
        ProfileLoaded(
          name: localName ?? user.fullName,
          email: localEmail ?? user.email,
          photo: photo,
        ),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    File? newPhoto,
  }) async {
    await LocalProfileStore.saveName(name);
    await LocalProfileStore.saveEmail(email);

    File? photo = newPhoto == null ? null : await LocalProfileStore.savePhoto(newPhoto);
    if (photo == null) {
      final current = state;
      photo = current is ProfileLoaded ? current.photo : null;
    }

    emit(ProfileLoaded(name: name, email: email, photo: photo));
  }
}
