import 'package:blocApi/Bloc/ListJson/TodoEvent.dart';
import 'package:blocApi/Bloc/ListJson/TodoState.dart';
import 'package:blocApi/Models/User_models.dart';
import 'package:blocApi/Service/Api_Service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final ApiService apiService = ApiService();
  List<UserModel> modelsUser = [];

  TodoBloc() : super(TodoInitial());
  @override
  TodoState get initialState => TodoInitial();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is GetData) {
      try {
        yield TodoLoading();
        modelsUser = await apiService.getUser();
        print("In Model user - > $modelsUser");
        yield TodoLoaded(modelsUser);
      } catch (e) {
        print("Error di $e");
      }
    }
  }
}
