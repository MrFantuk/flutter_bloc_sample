part of 'custom_model_shared_prefs_bloc.dart';

abstract class CustomModelSharedPrefsEvent {}

class InitCustomModelSharedPrefsBloc extends CustomModelSharedPrefsEvent {}


class SaveModelToPrefs extends CustomModelSharedPrefsEvent {
  final TextColorModel model;

  SaveModelToPrefs(this.model);
}
