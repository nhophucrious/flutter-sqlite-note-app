// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class UserInput extends StatefulWidget {
  final Function insertFunction;
  const UserInput({Key? key, required this.insertFunction}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final textController = TextEditingController();
  final additionalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Column(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                style: const TextStyle(fontSize: 18),
                autofocus: false,
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Note title',
                  prefixIcon: const Icon(Icons.note_add),
                  suffixIcon: IconButton(
                      onPressed: () {
                        textController.clear();
                      },
                      icon: const Icon(Icons.clear)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  hintText: 'Add something...', // Added this
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
            ),
          ]),
          ElevatedButton(
              onPressed: () {
                var myTodo = Todo(
                  title: textController.text.trim(),
                  creationDate: DateTime.now(),
                  isChecked: false,
                );
                setState(() {
                  widget.insertFunction(myTodo);
                });
                Navigator.pop(context);
              },
              child: const Icon(Icons.note_add))
        ],
      ),
    );
  }
}
