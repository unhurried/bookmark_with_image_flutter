import 'package:bookmark_with_image_flutter/bookmark_list.dart';
import 'package:bookmark_with_image_flutter/bookmark_store.dart';
import 'package:bookmark_with_image_flutter/config_button.dart';
import 'package:bookmark_with_image_flutter/url_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'orm/config_store.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _padding = 16.0;

    var widget = Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, _padding, 0, _padding),
                  alignment: Alignment.centerRight,
                  child: UrlForm(),
                ),
                Container(
                  margin: EdgeInsets.all(_padding),
                  child: ConfigButton(),
                ),
              ],
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.fromLTRB(_padding, 0, _padding, _padding),
                    child: BookmarkList(_padding),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return MultiProvider(providers: [
      ChangeNotifierProvider<BookmarkStore>(create: (context) {
        var bs = BookmarkStore();
        bs.init();
        return bs;
      }),
    ], child: widget);
  }
}
