import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final _textController = TextEditingController();

  int cont = 0;

  String organizacao = '';
  String requisitos = '';
  String investimentos = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //display text
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.blue), //apply style to all
                  children: [
                    const TextSpan(
                        text: 'Organização\n\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    TextSpan(
                        text: '$organizacao\n\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18)),
                    const TextSpan(
                        text: 'Requisitos\n\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    TextSpan(
                        text: '$requisitos\n\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18)),
                    const TextSpan(
                        text: 'Investimentos\n\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    TextSpan(
                        text: '$investimentos\n\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18)),
                  ],
                ),
              ),
            ),
          ),
          //text input
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Edite seu evento',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  _textController.clear(); //clear text in textfield
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              //update text to our variable
              if (cont == 0) {
                setState(() {
                  organizacao = _textController.text;
                  cont += 1;
                });
              } else if (cont == 1) {
                setState(() {
                  requisitos = _textController.text;
                  cont += 1;
                });
              } else if (cont == 2) {
                setState(() {
                  investimentos = _textController.text;
                  cont = 0;
                });
              }
            },
            color: Colors.orange,
            child: const Text('Submit', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
