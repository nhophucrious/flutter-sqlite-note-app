import 'package:flutter/material.dart';
import './screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var db = DatabaseConnect();
  // dummy data for testing
  /*await db.insertTodo(Todo(
      title: 'Sample todo', creationDate: DateTime.now(), isChecked: true));
  print(await db.getTodo());*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
