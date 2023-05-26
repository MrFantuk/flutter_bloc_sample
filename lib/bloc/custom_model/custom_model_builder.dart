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
          return Column(
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text("Future laoding data")
            ],
          );
        }
        if (state is CustomModelLoaded) {
          return myBuilder(state.myModel);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
