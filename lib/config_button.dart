import 'package:flutter/material.dart';

import 'config_page.dart';

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
