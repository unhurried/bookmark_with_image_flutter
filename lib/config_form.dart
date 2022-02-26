import 'package:bookmark_with_image_flutter/bookmark_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigForm extends StatelessWidget {
  final _urlInputController = TextEditingController();
  final onSubmit =
      (BuildContext context, TextEditingController controller) async {
    await context.read<BookmarkStore>().addItem(controller.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Bookmark added.'),
      duration: Duration(seconds: 1),
    ));
    controller.text = "";
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
              controller: _urlInputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
                isDense: true,
              ),
              style: TextStyle(height: 1.0),
              autofocus: true,
              onFieldSubmitted: (value) {
                onSubmit(context, _urlInputController);
              },
            ),
          ),
        ]),
        SizedBox(height: 15),
        Row(children: [
          Container(width: 120, child: Text("Launch Options")),
          Flexible(
            child: TextFormField(
              controller: _urlInputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
                isDense: true,
              ),
              style: TextStyle(height: 1.0),
              autofocus: true,
              onFieldSubmitted: (value) {
                onSubmit(context, _urlInputController);
              },
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
                  onSubmit(context, _urlInputController);
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
