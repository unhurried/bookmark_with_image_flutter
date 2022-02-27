import 'dart:io';
import 'dart:typed_data';
import 'package:bookmark_with_image_flutter/bookmark_store.dart';
import 'package:bookmark_with_image_flutter/orm/config_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BookmarkItem extends StatelessWidget {
  final String url;
  final Uint8List? _thumbnail;

  BookmarkItem(this.url, this._thumbnail);

  onTap(BuildContext context, String url) async {
    var browserOption = await context.read<ConfigStore>().get;
    var browserPath = browserOption.browserPath;
    var lanchOptions = browserOption.launchOptions!.isEmpty
        ? []
        : browserOption.launchOptions!.split(' ');
    if (browserPath != null) {
      print(browserPath);
      print([...lanchOptions, url]);
      await Process.run(browserPath, [...lanchOptions, url]);
    } else {
      await launch(url);
    }
  }

  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      child: Stack(
        children: [
          InkWell(
            onTap: () async {
              await onTap(context, url);
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: _thumbnail != null
                  ? Image.memory(
                      _thumbnail!,
                      fit: BoxFit.contain,
                    )
                  : null,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  context.read<BookmarkStore>().deleteItem(url);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Bookmark deleted."),
                    duration: Duration(seconds: 1),
                  ));
                },
                icon: Icon(Icons.highlight_off)),
          ),
        ],
      ),
    );
  }
}
