import 'package:bookmark_with_image_flutter/bookmark_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UrlForm extends StatelessWidget {
  final _urlInputController = TextEditingController();

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
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              width: 80,
              child: ElevatedButton(
                onPressed: () async {
                  await context
                      .read<BookmarkStore>()
                      .addItem(_urlInputController.text);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Bookmark added.'),
                    duration: Duration(seconds: 1),
                  ));
                  _urlInputController.text = "";
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
