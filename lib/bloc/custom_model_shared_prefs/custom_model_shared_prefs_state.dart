part of 'custom_model_shared_prefs_bloc.dart';

abstract class CustomModelSharedPrefsState {}

class CustomModelSharedPrefsInitial extends CustomModelSharedPrefsState {}

class CustomModelSharedPrefsLoaded extends CustomModelSharedPrefsState {
  final TextColorModel myModel;

  CustomModelSharedPrefsLoaded(this.myModel);
}

class CustomModelSharedPrefsError extends CustomModelSharedPrefsState {
  final String error;

  CustomModelSharedPrefsError(this.error);
}
