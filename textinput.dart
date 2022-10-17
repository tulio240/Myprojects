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
        primarySwatch: Colors.orange,
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
  List<TextEditingController> _controllers = [];
  List<TextField> _fields = [];

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _addTile() {
    return ListTile(
      title: Icon(Icons.add),
      onTap: (){
        final controller = TextEditingController();
        final field = TextField(
          controller: controller,
          decoration: InputDecoration(
            icon: Icon(
              Icons.fitness_center,
              color: Colors.orange,
              size: 40,
            ),
            border: OutlineInputBorder(),
            labelText: "name${_controllers.length + 1}",
          ),
        );
        setState((){
          _controllers.add(controller);
          _fields.add(field);
        }
        );
      },
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: _fields.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: _fields[index],
        );
      },
    );
  }

  Widget _okButton() {
    return ElevatedButton(
      onPressed: () async {
        String text = _controllers
          .where((element) => element.text != "")
          .fold("", (acc, element) => acc += "${element.text}\n");
        final alert = AlertDialog(
          title: Text("Count: ${_controllers.length}"),
          content: Text(text.trim()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ]
        );
        await showDialog(
          context: context,
          builder: (BuildContext context) => alert,
        );
        setState(() {});
      },
      child: Text("OK"),
    );
  }

/*  void _addCard() {
    setState(() {
      _cardList.add(_card());
    });
  } */

 /* Widget _card() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            fitnessIcon(),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30.0),
                              child: _fields[_cardList.indexOf(_card())],
                            )
//                            Padding(
//                              padding: const EdgeInsets.all(5),
//                              child: Align(
//                                alignment: Alignment.center,
//                                child: _fields[_cardList.indexOf(_card())],
//                              )
//                            ),
//                            SizedBox(
//                              height: 10,
//                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }*/

  Widget fitnessIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.fitness_center,
          color: Colors.orange,
          size: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test app",
      home: Scaffold(
        appBar: AppBar(title: Text("Tarefa Flutter")),
        body: Column(
          children: [
            _addTile(),
            Expanded(child: _listView()),
            _okButton(),
          ],
        ),
        /*Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _fields.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: _fields[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),*/
        /*floatingActionButton: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: (){
//                  _addCard();
                  _addTile();
                },
                child: Icon(Icons.add),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () async {
                  String text = _controllers
                    .where((element) => element.text != "")
                    .fold("", (acc, element) => acc += "${element.text}\n");
                  final alert = AlertDialog(
                    title: Text("Count: ${_controllers.length}"),
                    content: Text(text.trim()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("OK"),
                      )
                    ]
                  );
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) => alert,
                  );
                  setState(() {});
                },
                child: Text("OK"),
              ),
            ),
          ],
        ),*/
      ),
    );
  }
}