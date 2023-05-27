import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/custom_model_shared_prefs/custom_bloc_shared_prefs_bloc_builder.dart';
import 'package:flutter_bloc_sample/bloc/custom_model_shared_prefs/custom_model_shared_prefs_bloc.dart';
import 'package:flutter_bloc_sample/model/text_with_color_model.dart';

class CustomModelSharedPrefSScreen extends StatefulWidget {
  const CustomModelSharedPrefSScreen({super.key});

  @override
  State<CustomModelSharedPrefSScreen> createState() => _CustomModelSharedPrefSScreenState();
}

class _CustomModelSharedPrefSScreenState extends State<CustomModelSharedPrefSScreen> {
  final TextEditingController textController = TextEditingController();
  Color? pickedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc with SharedPrefs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                    title: Text("Bloc data from shared preferences:"),
                  ),
                  CustomModelSharedPrefsBuilder(
                    myBuilder: (myModel) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: myModel.color ?? Theme.of(context).primaryColor,
                      ),
                      title: Text(myModel.title),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
                child: ListView(
              children: [
                const Text("EDITABLE BLOC DATA:"),
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(hintText: "Some title"),
                ),
                ColorPicker(
                    color: pickedColor ?? Colors.blue,
                    onColorChanged: (colorValue) {
                      setState(() {
                        pickedColor = colorValue;
                      });
                    }),
                ElevatedButton(
                    onPressed: () {
                      final provider = BlocProvider.of<CustomModelSharedPrefsBloc>(context, listen: false);
                      provider.add(SaveModelToPrefs(TextColorModel(title: textController.text, color: pickedColor)));
                    },
                    child: const Text("Save"))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
