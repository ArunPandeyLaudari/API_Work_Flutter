import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapi_aplication/features/home/presentation/blocs/bloc/todo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Screen'),
        centerTitle: true,
      ),

      body: BlocBuilder<TodoBloc,TodoState>(
        builder:(context,state){
          if(state is fetchTodoFall){
            return Center(child:Text(state.errorMessage));
          }
         
          if(state is fetchTodoLoaded){
            return Center(child: Text("${state.todo.length}"));
          }

          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        },

      )
      
    );
  }
}