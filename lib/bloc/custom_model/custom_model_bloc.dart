import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/text_with_color_model.dart';

part 'custom_model_event.dart';
part 'custom_model_state.dart';

class CustomModelBloc extends Bloc<CustomModelEvent, CustomModelState> {
  CustomModelBloc() : super(CustomModelInitial()) {
    on<ChangeCustomModelTitle>(_changeTitle);
    on<ChangeCustomModelColor>(_changeColor);
    on<ChangeCustomModelTitleAndColor>(
      (event, emit) async {
        // Симуляция загрузки
        emit(CustomModelLoading());
        // Симуляция ожидания
        await Future.delayed(const Duration(seconds: 3));
        emit(CustomModelLoaded(event.myModel));
      },
    );
    on<ThrowCustomModelError>(
      (event, emit) async {
        // Симуляция загрузки
        emit(CustomModelLoading());
        // Симуляция ожидания
        await Future.delayed(const Duration(seconds: 3));
        emit(CustomModelError(event.error));
      },
    );
  }

  Future<void> _changeTitle(ChangeCustomModelTitle event, Emitter<CustomModelState> emit) async {
    // Симуляция загрузки
    emit(CustomModelLoading());
    // Симуляция ожидания
    await Future.delayed(const Duration(seconds: 3));
    emit(CustomModelLoaded(TextColorModel(title: event.title)));
  }

  Future<void> _changeColor(ChangeCustomModelColor event, Emitter<CustomModelState> emit) async {
    // Симуляция загрузки
    emit(CustomModelLoading());
    // Симуляция ожидания
    await Future.delayed(const Duration(seconds: 3));
    emit(CustomModelLoaded(TextColorModel(title: "Default title", color: event.color)));
  }
}
