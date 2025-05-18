import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapi_aplication/features/home/data/models/todo.dart';
import 'package:todoapi_aplication/features/home/data/repositories/todo_repositpry.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  
  final TodoRepository todoRepository;


  TodoBloc(this.todoRepository) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
      // TODO: implement event handler 
    });

    on<FetchTodoEvent>((event, emit) async {
      emit(fetchTodoLoading());
      final result=await todoRepository.fetchTodo();
      
      result.fold(
        (error)=> emit(fetchTodoFall(error.errorMessage)),
        (success)=>emit(fetchTodoLoaded(success)));
    });
  }
}
