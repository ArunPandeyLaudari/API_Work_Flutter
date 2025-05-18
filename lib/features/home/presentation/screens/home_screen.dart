import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapi_aplication/constants/app_routes.dart';
import 'package:todoapi_aplication/features/home/presentation/blocs/bloc/todo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final todoBloc = context.read<TodoBloc>().add(FetchTodoEvent());

    // Do not call bloc.add in build; trigger FetchTodoEvent elsewhere (e.g., in initState of a StatefulWidget)
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Screen'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap:() => Navigator.of(context).pushNamed(AppRoutes.addTodoScreen),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(Icons.add),
              ),
            
          )
        ],
      ),

      body: BlocBuilder<TodoBloc,TodoState>(
        builder:(context,state){
          if(state is fetchTodoFall){
            // Replace with your error UI
            return Center(child: Text('Failed to fetch todos'));
          }
         
          if(state is fetchTodoLoaded){
          return ListView.builder(
              itemCount: state.todo.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    leading: Checkbox(
                      value: state.todo[index].isCompleted,
                      onChanged: (e) {},
                    ),
                    title: Text(state.todo[index].title),
                    subtitle: Text(state.todo[index].description),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_outline),
                    ),
                  ),
                );
              },
            );
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