import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

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
  final _textController = TextEditingController();

  int cont = 0;

  String userInput = '';
  String organizacao = 'a';
  String requisitos = 'b';
  String investimentos = 'c';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding (
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //display text
              Expanded(
                child: Center(
                  child: Text("Organização\n\n$organizacao\n\n\nRequisitos\n\n$requisitos\n\n\nInvestimentos\n\n$investimentos", style: TextStyle(fontSize: 20),),
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
                  if (cont == 0){
                    setState(() {
                      organizacao = _textController.text;
                      cont += 1;
                    });
                  }
                  else if (cont == 1){
                    setState(() {
                      requisitos = _textController.text;
                      cont += 1;
                    });
                  }
                  else{
                    setState(() {
                      investimentos = _textController.text;
                      cont += 1;
                    });
                  }
                },
                color: Colors.orange,
                child: const Text('Submit', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        )
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
