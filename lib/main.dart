import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/custom_model/custom_model_bloc.dart';

import 'screen/primary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CustomModelBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc samples',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const PrimaryScreen(),
      ),
    );
  }
}
