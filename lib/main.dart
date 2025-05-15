import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapi_aplication/core/services/service_locator.dart';
import 'package:todoapi_aplication/features/home/data/repositories/todo_repositpry.dart';
import 'package:todoapi_aplication/features/home/presentation/blocs/bloc/todo_bloc.dart';
import 'package:todoapi_aplication/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc(getIt<TodoRepository>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      
      ),
    );
  }
}
