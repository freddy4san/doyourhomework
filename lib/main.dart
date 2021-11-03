import 'package:doyourhomework/Job.dart';
import 'package:flutter/material.dart';
import 'package:doyourhomework/todolist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/todolist': (context) => ToDoList(message: 'Do not fck with me'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //creating a list of jobs to do where appears a person's name with a task
  List<Job> jobs = [
    Job('Freddy', 'Kitchen'),
    Job('Manu', 'Bathroom'),
    Job('Jesee', 'Common Areas'),
    Job('Tyson', 'Recycling and Bins'),
  ];

  void _rotateTask() {
    int i = 0;
    var lastask = jobs.first.task;
    for (var job in jobs) {
      if (i < jobs.length - 1) {
        job.task = jobs[i + 1].task;
      } else {
        jobs.last.task = lastask;
      }
      i++;
    }

    var items = jobs.map((job) => job.task + '-' + job.name).toList();
    print(items);
  }

  void _incrementCounter() {
    _rotateTask();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have incremented the weeks this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/todolist', arguments: jobs);
              },
              child: Text("Task List"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.hourglass_top_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
