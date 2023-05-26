import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/custom_model/custom_model_bloc.dart';
import 'package:flutter_bloc_sample/model/text_with_color_model.dart';

class CustomModelBuilder extends StatelessWidget {
  final Widget Function(TextColorModel myModel) myBuilder;
  const CustomModelBuilder({super.key, required this.myBuilder});

  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<CustomModelBloc>(context);
    return BlocBuilder(
      bloc: myBloc,
      builder: (context, state) {
        if (state is CustomModelInitial) {
          return const Text("Initial state");
        }
        if (state is CustomModelLoading) {
          return const ListTile(
            title: Text("Loading data"),
            trailing: CircularProgressIndicator(),
          );
        }
        if (state is CustomModelLoaded) {
          return myBuilder(state.myModel);
        }
        if (state is CustomModelError) {
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
