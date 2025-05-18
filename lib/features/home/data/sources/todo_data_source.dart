
import 'package:todoapi_aplication/core/api/api_calls.dart';
import 'package:todoapi_aplication/features/home/data/models/todo.dart';

abstract class TodoDataSource {
  Future<List<Todo>> fetchTodo();
  }

  class TodoDataSourceImpl extends TodoDataSource
  {
    final  ApiCalls apiCalls;
    TodoDataSourceImpl(this.apiCalls);


    @override
    Future<List<Todo>> fetchTodo() async{
      final result = await apiCalls.getData(endpoint: "todo") as List;
      return result.map((todo) => Todo.fromMap(todo)).toList();
      // throw UnimplementedError();
    }
  }