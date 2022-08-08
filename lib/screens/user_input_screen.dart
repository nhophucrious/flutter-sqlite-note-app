import 'package:flutter/material.dart';
import '../widgets/user_input.dart';
import '../models/database_model.dart';
import '../models/todo_model.dart';

class UserInputScreen extends StatefulWidget {
  const UserInputScreen({Key? key}) : super(key: key);

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  var db = DatabaseConnect();
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Adding a note'),
      ),
      body: Center(
          child: UserInput(
        insertFunction: addItem,
      )),
    );
  }
}
