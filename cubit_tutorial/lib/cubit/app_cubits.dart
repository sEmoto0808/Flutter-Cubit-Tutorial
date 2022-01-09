import 'package:bloc/bloc.dart';
import 'package:cubit_tutorial/services/data_services.dart';

import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {

  final DataServices dataServices;

  AppCubits({required this.dataServices}) : super(InitialState()) {
    // trigger
    emit(WelcomeState());
  }

  void getData() async {
    try {
      // trigger Loading
      emit(LoadingState());
      final places = await dataServices.getInfo();
      // trigger Loaded
      emit(LoadedState(places));
    } catch (e) {}
  }
}