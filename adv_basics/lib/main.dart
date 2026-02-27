import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BackdropGroup(child:Image.asset("assets/quiz.png"));

    return MaterialApp(
      title: 'learn_flutter_the_fun_way!',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter quiz'),
        ),
        body: const Center(
          child: Text('Welcome to Flutter Quiz!'),
          
        ),
      ),
    );
  }
}