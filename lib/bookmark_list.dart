import 'package:bookmark_with_image_flutter/bookmark_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkList extends StatelessWidget {
  final double _padding;
  BookmarkList(this._padding);

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
