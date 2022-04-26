import 'package:cereal/redux/sources/works.dart';
import 'package:cereal/redux/sources/chapter.dart';

import 'package:cereal/resolvers/resolver.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

import 'package:uno/uno.dart';

final uno = Uno();

abstract class HttpResolver extends Resolver {
  const HttpResolver();

  String createWorkUrl(String id);
  String createChapterUrl(String workId, String chapterId);
  Work getWorkFromUrl(Document doc);
  Element getChapterFromUrl(Document doc);
  @override
  Future<Element> getChapterText(String workId, String chapterId) async {
    return getChapterFromUrl(parse((await uno.get(
            createChapterUrl(workId, chapterId),
            responseType: ResponseType.plain))
        .data));
  }

  @override
  Future<Work> getWork(String id) async {
    return getWorkFromUrl(parse(
        (await uno.get(createWorkUrl(id), responseType: ResponseType.plain))
            .data));
  }
}
