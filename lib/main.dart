import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/custom_model/custom_model_bloc.dart';
import 'package:flutter_bloc_sample/bloc/custom_model_shared_prefs/custom_model_shared_prefs_bloc.dart';
import 'package:flutter_bloc_sample/service/shared_prefs_service.dart';

import 'screen/primary.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferenceService.init();
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
        BlocProvider(
          create: (context) => CustomModelSharedPrefsBloc()..add(InitCustomModelSharedPrefsBloc()),
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
