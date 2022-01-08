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
