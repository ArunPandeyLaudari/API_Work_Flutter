import 'package:dartz/dartz.dart';
import 'package:todoapi_aplication/core/api/api_error.dart';
import 'package:todoapi_aplication/features/home/data/sources/todo_data_source.dart';

import '../models/todo.dart';

abstract class TodoRepository {
  Future<Either<ApiError,List<Todo>>>fetchTodo();
}

class TodoRepositoryImpl extends TodoRepository
{
  final TodoDataSource todoDataSource;
  TodoRepositoryImpl(this.todoDataSource);

  @override
   Future<Either<ApiError,List<Todo>>> fetchTodo() async
   {
    // 
    try
    {
      final result = await todoDataSource.fetchTodo();
      return right<ApiError, List<Todo>>(result);
    }
    catch(e)
    {
      return left<ApiError, List<Todo>>(ApiError(errorMessage: e.toString(),));
    }
   }

}