import 'dart:convert';
import 'dart:typed_data';

class BookmarkEntity {
  String url;
  int? order;
  String? title;
  String? thumbnailUrl;
  Uint8List? thumbnail;
  String? thumbnailExt;

  BookmarkEntity(
      {required this.url,
      this.title,
      this.order,
      this.thumbnailUrl,
      this.thumbnail,
      this.thumbnailExt});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'order': order,
      'title': title,
      'thumbnailUrl': thumbnailUrl,
      'thumbnail': thumbnail != null ? base64.encode(thumbnail!) : null,
      'thumbnailExt': thumbnailExt,
    };
  }
}
