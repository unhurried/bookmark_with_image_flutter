import 'package:bookmark_with_image_flutter/orm/config_store.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigForm extends StatefulWidget {
  const ConfigForm({Key? key}) : super(key: key);
  @override
  _ConfigFormState createState() => _ConfigFormState();
}

class _ConfigFormState extends State<ConfigForm> {
  final _bpCntr = TextEditingController();
  final _loCntr = TextEditingController();

  onSubmit(BuildContext context) async => {
        await context.read<ConfigStore>().set(new ConfigCompanion(
            browserPath: drift.Value(_bpCntr.text),
            launchOptions: drift.Value(_loCntr.text)))
      };

  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text("Browser Configuration")),
        SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(width: 120, child: Text("Browser Path")),
          Flexible(
            child: TextFormField(
              controller: _bpCntr,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
                isDense: true,
              ),
              style: TextStyle(height: 1.0),
              autofocus: true,
            ),
          ),
        ]),
        SizedBox(height: 15),
        Row(children: [
          Container(width: 120, child: Text("Launch Options")),
          Flexible(
            child: TextFormField(
              controller: _loCntr,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
                isDense: true,
              ),
              style: TextStyle(height: 1.0),
              autofocus: true,
            ),
          ),
        ]),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              width: 80,
              child: ElevatedButton(
                onPressed: () {
                  onSubmit(context);
                },
                child: const Text("Save"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              width: 80,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
