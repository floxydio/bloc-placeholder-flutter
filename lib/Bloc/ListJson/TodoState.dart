import 'package:equatable/equatable.dart';
import '../../Models/User_models.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  const TodoInitial();

  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {
  const TodoLoading();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TodoLoaded extends TodoState {
  final List<UserModel> userList;
  const TodoLoaded(this.userList);

  @override
  List<Object> get props => [userList];
}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
  @override
  List<Object> get props => [message];
}
