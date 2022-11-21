import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  final _pageController = PageController(initialPage: 1);

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Page view"),
        actions: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () => _pageController.previousPage(
              duration: const Duration(seconds: 1), 
              curve: Curves.easeInOut,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () => _pageController.nextPage(
              duration: const Duration(seconds: 1), 
              curve: Curves.easeInOut,
            ),
          )
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Container(
            color: Colors.red,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.purple,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.blue,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.red,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.red,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.red,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.red,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.red,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.red,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.red,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
          Container(
            color: Colors.red,
            child: Image.asset("assets/tela_eventos_futsal.png", fit: BoxFit.cover)
          ),
        ],
      ),
    );
  }
}
