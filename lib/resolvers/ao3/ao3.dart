import 'package:cereal/redux/sources/works.dart';
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
        chapters: Chapters({
          '57598366': Chapter(
              id: '57598366',
              title: '1 Introduction',
              words: 1317360,
              wordsRead: 0,
              published: DateTime(2020, 5, 1))
        }));
  }

  @override
  html.Element getChapterFromUrl(doc) {
    return doc.querySelector('#workskin')!;
  }
}
