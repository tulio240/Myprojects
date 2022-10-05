import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> _cardList = [];

  void _addCard() {
    setState(() {
      _cardList.add(_card());
    });
  }

  Widget _card() {
    return Card(
      child: Column(
        children: [
          Text('name'),
          Text('standard'),
          Text('Roll No'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test app",
      home : Scaffold(
        appBar: AppBar(title: Text("Tarefa Flutter")) ,
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _cardList.length,
                  itemBuilder: (context, index) {
                    return _cardList[index];
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: _addCard,
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
