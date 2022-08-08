import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IndividualCard extends StatelessWidget {
  final String title;
  final DateTime creationDate;
  final bool isChecked;
  const IndividualCard({
    Key? key,
    required this.title,
    required this.creationDate,
    required this.isChecked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note: $title'),
        centerTitle: true,
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            'Creation: ${DateFormat.yMMMMd().add_Hm().format(creationDate)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Status: ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                isChecked ? 'Complete' : 'Incomplete',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isChecked ? Colors.green : Colors.red,
                    fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.done))
        ]),
      ),
    );
  }
}
