// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:love_app/widgets/todo_card.dart';
import '../models/database_model.dart';

class TodoList extends StatefulWidget {
  final Function insertFunction;
  final Function deleteFunction;
  const TodoList({
    Key? key,
    required this.insertFunction,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
            future: db.getTodo(),
            initialData: const [],
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              var data = snapshot.data;
              final dataLength = data!.length;

              return dataLength == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                            child: Text(
                          "It's empty here...",
                          style: TextStyle(fontSize: 25),
                        )),
                      ],
                    )
                  : ListView.builder(
                      itemCount: dataLength,
                      itemBuilder: (context, i) => TodoCard(
                            id: data[i].id,
                            title: data[i].title,
                            creationDate: data[i].creationDate,
                            isChecked: data[i].isChecked,
                            insertFunction: widget.insertFunction,
                            deleteFunction: widget.deleteFunction,
                          ));
            }));
  }
}
