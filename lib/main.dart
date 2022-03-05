import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';
import 'orm/config_store.dart';

import 'dart:ffi';
import 'dart:io';
import 'package:sqlite3/open.dart';

import 'package:path/path.dart' as p;

void main() {
  open.overrideFor(OperatingSystem.windows, () {
    final libraryNextToScript =
        File('${p.dirname(Platform.script.toFilePath())}\\sqlite3.dll');
    return DynamicLibrary.open(libraryNextToScript.path);
  });
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
