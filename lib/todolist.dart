import 'package:doyourhomework/Job.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key, required this.message}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    final List<Job> jobs =
        ModalRoute.of(context)!.settings.arguments as List<Job>;

    return Scaffold(
        appBar: AppBar(
          title: Text("Task List"),
        ),
        body: ListView(
          children: [
            for (var job in jobs)
              ListTile(
                title: Text(job.name),
                subtitle: Text(job.task),
              )
          ],
        ));
  }
}
