import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/custom_model_shared_prefs/custom_model_shared_prefs_bloc.dart';
import 'package:flutter_bloc_sample/model/text_with_color_model.dart';

class CustomModelSharedPrefsBuilder extends StatelessWidget {
  final Widget Function(TextColorModel myModel) myBuilder;
  const CustomModelSharedPrefsBuilder({super.key, required this.myBuilder});

  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<CustomModelSharedPrefsBloc>(context);
    return BlocBuilder(
      bloc: myBloc,
      builder: (context, state) {
        
        if (state is CustomModelSharedPrefsLoaded) {
          return myBuilder(state.myModel);
        }
        if (state is CustomModelSharedPrefsError) {
          return ListTile(
            leading: const Icon(
              CupertinoIcons.info,
              color: Colors.red,
            ),
            title: Text(state.error),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
