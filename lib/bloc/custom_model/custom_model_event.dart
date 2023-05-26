part of 'custom_model_bloc.dart';

abstract class CustomModelEvent {}

class ChangeCustomModelTitle extends CustomModelEvent {
  final String title;

  ChangeCustomModelTitle(this.title);
}

class ChangeCustomModelColor extends CustomModelEvent {
  final Color color;

  ChangeCustomModelColor(this.color);
}

class ChangeCustomModelTitleAndColor extends CustomModelEvent {
  final TextColorModel myModel;

  ChangeCustomModelTitleAndColor(this.myModel);
}

class ThrowCustomModelError extends CustomModelEvent {
  final String error;

  ThrowCustomModelError(this.error);
}
