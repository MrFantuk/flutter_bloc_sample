import 'dart:math';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/custom_model/custom_model_bloc.dart';
import 'package:flutter_bloc_sample/bloc/custom_model/custom_model_builder.dart';
import 'package:flutter_bloc_sample/screen/custom_model_bloc_screens/custom_model_bloc_editor.dart';

class CustomModelBlocScreen extends StatelessWidget {
  const CustomModelBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customModelBlocProvider = BlocProvider.of<CustomModelBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Model Bloc")),
      body: Column(
        children: [
          const ListTile(
            title: Text("Example:"),
          ),
          Card(
            child: CustomModelBuilder(
                myBuilder: (data) => ListTile(
                      leading: data.color != null
                          ? CircleAvatar(
                              backgroundColor: data.color!,
                            )
                          : null,
                      title: Text(data.title),
                      subtitle: data.color != null ? null : const Text("No color added"),
                    )),
          ),
          const Divider(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const ListTile(
                  title: Text("change only text:"),
                ),
                OutlinedButton(
                    onPressed: () {
                      Random random = Random();
                      int randomNumber = random.nextInt(strings.length);
                      customModelBlocProvider.add(ChangeCustomModelTitle(strings[randomNumber]));
                    },
                    child: const Text("Change title to random String")),
                const Divider(),
                const ListTile(
                  title: Text("change only color:"),
                ),
                ColorPicker(pickersEnabled: const <ColorPickerType, bool>{
                  ColorPickerType.both: false,
                  ColorPickerType.primary: false,
                  ColorPickerType.accent: true,
                  ColorPickerType.bw: false,
                  ColorPickerType.custom: false,
                  ColorPickerType.wheel: false
                }, onColorChanged: (colorValue) => customModelBlocProvider.add(ChangeCustomModelColor(colorValue))),
                const Divider(),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomModelBlocEditor())),
                  child: const Text("change color and text"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      customModelBlocProvider.add(ThrowCustomModelError("error 400")),
                  child: const Text("Throw error"),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

List<String> strings = [
  'title',
  'John Doe',
  'Music',
  'Video',
  'VS code',
  'Android Studio',
  'Game',
  'Flutter',
  'Awesome',
  'Flutter Awesome',
  'Game',
  'Flutter',
  'Awesome',
];
