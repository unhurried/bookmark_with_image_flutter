import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bookmark_list.dart';
import 'config_button.dart';
import 'orm/bookmark_store.dart';
import 'url_form.dart';

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
        final store = new BookmarkStore();
        store.getList();
        return store;
      })
    ], child: widget);
  }
}
