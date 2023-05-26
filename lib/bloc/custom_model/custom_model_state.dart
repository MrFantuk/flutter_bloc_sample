part of 'custom_model_bloc.dart';

abstract class CustomModelState {}

class CustomModelInitial extends CustomModelState {}

class CustomModelLoading extends CustomModelState {}

class CustomModelLoaded extends CustomModelState {
  final TextColorModel myModel;

  CustomModelLoaded(this.myModel);
}

class CustomModelError extends CustomModelState {}
