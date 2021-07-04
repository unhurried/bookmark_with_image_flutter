import 'package:bookmark_with_image_flutter/bookmark_store.dart';
import 'package:bookmark_with_image_flutter/config_page.dart';
import 'package:flutter/material.dart';

class ConfigButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ConfigPage()));
        },
        icon: Icon(Icons.settings));
  }
}
