import 'package:flutter/material.dart';

class TodoAppForm extends StatelessWidget {
  const TodoAppForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TodoForm")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(hintText: "Title")),
                TextFormField(
                  decoration: InputDecoration(hintText: "Description"),
                  maxLines: 6,
                  minLines: 3,
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Save")),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
