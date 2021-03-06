import 'package:cubit_tutorial/model/data_model.dart';
import 'package:equatable/equatable.dart';

/// Cubitで管理するStateのベースクラス
abstract class CubitStates extends Equatable {}

/// Cubitを使ってアプリを開発する時はInitialStateが必要
class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

/// 通信中のState
class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

/// 通信に成功した時のState
class LoadedState extends CubitStates {
  final List<DataModel> places;

  LoadedState(this.places);

  @override
  // TODO: implement props
  List<Object> get props => [places];
}

/// 通信に成功した時のState
class DetailState extends CubitStates {
  final DataModel place;

  DetailState(this.place);

  @override
  // TODO: implement props
  List<Object> get props => [place];
}
