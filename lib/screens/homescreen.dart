import 'package:flutter/material.dart';
import 'package:love_app/models/database_model.dart';
import 'package:love_app/screens/user_input_screen.dart';
import '../widgets/todo_list.dart';
import '../models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DatabaseConnect();
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('What to do 🤔'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TodoList(
              insertFunction: addItem,
              deleteFunction: deleteItem,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /*showModalBottomSheet(
              context: context,
              builder: (context) => Center(
                      child: UserInput(
                    insertFunction: addItem,
                  )));*/
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UserInputScreen()));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
