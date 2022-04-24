import 'package:cereal/redux/sources/sources.dart';
import 'package:cereal/redux/sources/chapter.dart';

import 'package:cereal/resolvers/resolver.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

import 'package:uno/uno.dart';

part 'http_resolver.freezed.dart';

final uno = Uno();

@freezed
class HttpResolver extends Resolver with _$HttpResolver {
  const factory HttpResolver({
    required String domain,
    required String Function(String id) createWorkUrl,
    required String Function(String workId, String chapterId) createChapterUrl,
    required Work Function(Document doc) getWorkFromUrl,
    required Document Function(Document doc) getChapterFromUrl,
  }) = _HttpResolver;

  @override
  Future<Document> getChapterText(String workId, String chapterId) async {
    return getChapterFromUrl(parse((await uno.get(
            "$domain/${createChapterUrl(workId, chapterId)}",
            responseType: ResponseType.plain))
        .data));
  }

  @override
  Future<Work> getWork(String id) async {
    return getWorkFromUrl(parse((await uno.get("$domain/${createWorkUrl(id)}",
            responseType: ResponseType.plain))
        .data));
  }
}
