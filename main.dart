import 'package:flutter/material.dart';
import 'event_editing.dart';

void main() {
  runApp(const EventsMainScreen());
}

class EventsMainScreen extends StatelessWidget {
  const EventsMainScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/tela_eventos_futsal.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 60,
          top: MediaQuery.of(context).size.height / 2 - 145,
          child: SizedBox(
            width: 240.0,
            height: 240.0,
            child: TextButton(
              child: const Text(''),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EventsScreen()),
                );
              },
            ),
          ),
        )
      ],
    )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}