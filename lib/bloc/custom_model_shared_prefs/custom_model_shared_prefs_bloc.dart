import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/model/text_with_color_model.dart';
import 'package:flutter_bloc_sample/service/shared_prefs_service.dart';

part 'custom_model_shared_prefs_event.dart';
part 'custom_model_shared_prefs_state.dart';

class CustomModelSharedPrefsBloc extends Bloc<CustomModelSharedPrefsEvent, CustomModelSharedPrefsState> {
  CustomModelSharedPrefsBloc() : super(CustomModelSharedPrefsInitial()) {
    on<InitCustomModelSharedPrefsBloc>((event, emit) async {
      final jsonModel = SharedPreferenceService.getTextColorModel(PreferenceKeys.textColorModelKey);

      final defaultData = TextColorModel(title: "Default Title data");

      emit(CustomModelSharedPrefsLoaded(jsonModel.isEmpty ? defaultData : TextColorModel.fromJson(jsonModel)));
    });

    on<SaveModelToPrefs>((event, emit) async {
      final encodedModel = event.model.toJson();
      await SharedPreferenceService.setTextColorModel(encodedModel);

      emit(CustomModelSharedPrefsLoaded(event.model));
    });
  }
}
