import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_sample/screen/custom_model_bloc_screens/custom_model_bloc_screen.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomModelBlocScreen())),
              title: const Text("bloc example 1"),
              trailing: const Icon(CupertinoIcons.chevron_right),
            ),
            ListTile(
              onTap: () {},
              title: const Text("bloc example 1"),
              trailing: const Icon(CupertinoIcons.chevron_right),
            ),
            ListTile(
              onTap: () {},
              title: const Text("cubit example 1"),
              trailing: const Icon(CupertinoIcons.chevron_right),
            ),
            ListTile(
              onTap: () {},
              title: const Text("cubit example 1"),
              trailing: const Icon(CupertinoIcons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
