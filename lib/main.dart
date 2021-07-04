import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookmark with Image',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MainPage(),
    );
  }
}
