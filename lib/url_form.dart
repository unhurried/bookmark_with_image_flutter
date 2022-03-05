import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'orm/bookmark_store.dart';

class UrlForm extends StatelessWidget {
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
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: 300,
              margin: EdgeInsets.zero,
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
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              width: 80,
              child: ElevatedButton(
                onPressed: () {
                  onSubmit(context, _urlInputController);
                },
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
