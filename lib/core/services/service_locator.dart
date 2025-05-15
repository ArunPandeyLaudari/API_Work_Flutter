import 'package:get_it/get_it.dart';
import 'package:todoapi_aplication/core/api/api_calls.dart';
import 'package:todoapi_aplication/features/home/data/repositories/todo_repositpry.dart';
import 'package:todoapi_aplication/features/home/data/sources/todo_data_source.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerLazySingleton<ApiCalls>(() => ApiCalls());
  getIt.registerLazySingleton<TodoDataSource>(() => TodoDataSource);
  getIt.registerLazySingleton<TodoRepository>(() => TodoRepository());
}