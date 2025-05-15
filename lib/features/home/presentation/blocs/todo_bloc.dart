

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapi_aplication/features/home/data/models/todo.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}