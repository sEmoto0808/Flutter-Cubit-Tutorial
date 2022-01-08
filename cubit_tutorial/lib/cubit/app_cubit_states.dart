import 'package:bloc/bloc.dart';
import 'package:cubit_tutorial/cubit/app_cubits.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit() : super(InitialState()) {
    emit(WelcomeState());
  }
}
