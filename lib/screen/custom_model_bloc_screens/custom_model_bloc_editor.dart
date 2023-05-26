import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/custom_model/custom_model_bloc.dart';
import 'package:flutter_bloc_sample/model/text_with_color_model.dart';

class CustomModelBlocEditor extends StatefulWidget {
  const CustomModelBlocEditor({super.key});

  @override
  State<CustomModelBlocEditor> createState() => _CustomModelBlocEditorState();
}

class _CustomModelBlocEditorState extends State<CustomModelBlocEditor> {
  final TextEditingController textController = TextEditingController();
  Color? pickedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Edit")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(hintText: "Some custom text"),
              ),
            ),
            ColorPicker(
                color: pickedColor ?? Colors.blue,
                onColorChanged: (colorValue) {
                  setState(() {
                    pickedColor = colorValue;
                  });
                }),
            OutlinedButton(
                onPressed: () {
                  final provider = BlocProvider.of<CustomModelBloc>(context, listen: false);
                  provider.add(ChangeCustomModelTitleAndColor(TextColorModel(title: textController.text, color: pickedColor)));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("bloc data updated")));
                },
                child: const Text("Update bloc data"))
          ],
        ),
      ),
    );
  }
}
