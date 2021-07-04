import 'package:bookmark_with_image_flutter/bookmark_entity.dart';
import 'package:universal_html/controller.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class Scraping {
  Future<BookmarkEntity> createBookmark(String url) async {
    final controller = WindowController();
    await controller.openHttp(uri: Uri.parse(url));
    // window must not be null as openHttp will throw an exception on failure.
    final doc = controller.window!.document;

    String? title;
    final ogTitle = doc.querySelector('meta[property="og:title"]');
    if (ogTitle != null && ogTitle.text != null) title = ogTitle.text!;
    final titleElem = doc.querySelector('title');
    if ((title == null || title.isEmpty) && titleElem != null)
      title = titleElem.innerText;

    final ogImage = doc.querySelector('meta[property="og:image"]');
    final String? thumbnailUri =
        ogImage != null ? ogImage.getAttribute('content') : null;
    final thumbnail = ogImage != null
        ? (await http.get(Uri.parse(thumbnailUri!))).bodyBytes
        : null;

    final entity = new BookmarkEntity(
      url: url,
      title: title,
      thumbnail: thumbnail,
      thumbnailUrl: thumbnailUri,
      thumbnailExt: thumbnailUri != null ? path.extension(thumbnailUri) : null,
    );
    return entity;
  }
}
