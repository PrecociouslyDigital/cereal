import 'package:cereal/redux/sources/sources.dart';
import 'package:cereal/resolvers/http/http_resolver.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:html/dom.dart' as html;

import '../../redux/sources/chapter.dart';

class AO3Resolver extends HttpResolver {
  const AO3Resolver();

  @override
  String createWorkUrl(String id) =>
      "https://archiveofourown.org/works/$id/navigate";

  @override
  String createChapterUrl(workId, chapterId) =>
      "https://archiveofourown.org/works/$workId/chapters/$chapterId";

  @override
  Work getWorkFromUrl(workDoc) {
    return Work(
        id: 'id',
        site: "https://archiveofourown.org/",
        title: "one",
        author: "two",
        tags: ISet(const <String>["three"]),
        chapters: Chapters());
  }

  @override
  html.Element getChapterFromUrl(chapterDoc) {
    return chapterDoc.querySelector('#workskin')!;
  }
}
