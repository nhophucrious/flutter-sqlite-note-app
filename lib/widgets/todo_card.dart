// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:love_app/screens/individual_note_screen.dart';
import '../models/todo_model.dart';
import 'package:intl/intl.dart';

class TodoCard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;
  TodoCard({
    Key? key,
    required this.id,
    required this.title,
    required this.creationDate,
    required this.isChecked,
    required this.insertFunction,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
      id: widget.id,
      title: widget.title,
      creationDate: widget.creationDate,
      isChecked: widget.isChecked,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              padding: const EdgeInsets.symmetric(vertical: 8),
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.red,
              onPressed: (context) {
                widget.deleteFunction(anotherTodo);
              },
              icon: Icons.delete,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => IndividualCard(
                          title: widget.title,
                          creationDate: widget.creationDate,
                          isChecked: widget.isChecked,
                        ))));
          },
          child: Card(
            color: Colors.grey[200],
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            shadowColor: Colors.amber[200],
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Checkbox(
                  value: widget.isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.isChecked = value!;
                    });
                    anotherTodo.isChecked = value!;
                    widget.insertFunction(anotherTodo);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(widget.creationDate),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
