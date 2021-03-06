import 'package:cubit_tutorial/cubit/app_cubit_states.dart';
import 'package:cubit_tutorial/cubit/app_cubits.dart';
import 'package:cubit_tutorial/pages/bottom_navigation/main_page.dart';
import 'package:cubit_tutorial/pages/detail_page.dart';
import 'package:cubit_tutorial/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// CubitStateを監視する
class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          } if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } if (state is LoadedState) {
            return const MainPage();
          } if (state is DetailState) {
            return const DetailPage();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
