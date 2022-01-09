import 'package:bloc/bloc.dart';

import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    // trigger
    emit(WelcomeState());
  }

  void getData() {
    try {
      // trigger Loading
      emit(LoadingState());
    } catch (e) {}
  }
}