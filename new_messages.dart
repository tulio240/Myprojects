import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:bubble/issue_clipper.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MessageScreen());
}

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

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

  final List<String> _messageList = [];
  final List<Bubble> _bubbles = [];

  String userInput = '';

  Bubble _addBubble(){
    return Bubble(
      margin: BubbleEdges.only(top: 10),
      color: Color.fromARGB(255, 144, 199, 146),
      child: Text(_messageList[cont], textAlign: TextAlign.right, style: TextStyle(fontSize: 11.0),),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: _bubbles.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: _bubbles[index],
        );      
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding (
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: _listView(),
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
                  String a = _textController.text;
                  _messageList.add(a);
                  var b = _addBubble();
                  setState(() {
                    _bubbles.add(b);
                  });
                  cont +=1;

                  if (cont == 1){
                    var b = Bubble(
                      margin: BubbleEdges.only(top: 10),
                      color: Color.fromARGB(255, 240, 227, 117),
                      child: Text("Hello user", textAlign: TextAlign.left, style: TextStyle(fontSize: 11.0),),
                    );
                    setState(() {
                    _bubbles.add(b);
                    });
                  }
                  else if (cont == 2){
                    var b = Bubble(
                      margin: BubbleEdges.only(top: 10),
                      color: Color.fromARGB(255, 240, 227, 117),
                      child: Text("Wowie", textAlign: TextAlign.left, style: TextStyle(fontSize: 11.0),),
                    );
                    setState(() {
                    _bubbles.add(b);
                    });
                  }
                  else{
                    var b = Bubble(
                      margin: BubbleEdges.only(top: 10),
                      color: Color.fromARGB(255, 240, 227, 117),
                      child: Text("Another message", textAlign: TextAlign.left, style: TextStyle(fontSize: 11.0),),
                    );
                    setState(() {
                    _bubbles.add(b);
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
