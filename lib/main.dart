import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';
import 'orm/config_store.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widget = MaterialApp(
      title: 'Bookmark with Image',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MainPage(),
    );

    return Provider<ConfigStore>(
        create: (context) {
          return ConfigStore();
        },
        child: widget);
  }
}
