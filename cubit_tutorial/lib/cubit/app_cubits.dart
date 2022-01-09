import 'package:bloc/bloc.dart';
import 'package:cubit_tutorial/model/data_model.dart';
import 'package:cubit_tutorial/services/data_services.dart';

import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {

  final DataServices dataServices;

  AppCubits({required this.dataServices}) : super(InitialState()) {
    // trigger
    emit(WelcomeState());
  }

  late final List<DataModel> places;

  void getData() async {
    try {
      // trigger Loading
      emit(LoadingState());
      places = await dataServices.getInfo();
      // trigger Loaded
      emit(LoadedState(places));
    } catch (e) {}
  }

  void emitDetail(DataModel data) {
    // trigger DetailPage
    emit(DetailState(data));
  }

  void goMain() {
    // trigger Loaded
    emit(LoadedState(places));
  }
}
