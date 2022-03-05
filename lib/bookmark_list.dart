import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'orm/bookmark_store.dart';

class BookmarkList extends StatefulWidget {
  final double _padding;
  BookmarkList(this._padding);

  @override
  State<StatefulWidget> createState() => _BookmarkListState(_padding);
}

class _BookmarkListState extends State<BookmarkList> {
  final double _padding;
  _BookmarkListState(this._padding);

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<BookmarkStore>(context).bookmarkList;

    return Column(children: [
      Wrap(
        spacing: _padding,
        runSpacing: _padding,
        children: list,
      ),
    ]);
  }
}
