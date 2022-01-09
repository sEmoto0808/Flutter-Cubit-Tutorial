import 'package:cubit_tutorial/cubit/app_cubit_logics.dart';
import 'package:cubit_tutorial/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // inject Cubit
      home: BlocProvider<AppCubits>(
        // create Cubit
        create: (context) => AppCubits(dataServices: DataServices()),
        // 画面表示
        child: const AppCubitLogics(),
      ),
    );
  }
}
