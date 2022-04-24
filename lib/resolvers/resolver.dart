import 'package:freezed_annotation/freezed_annotation.dart';
import "package:html/dom.dart";

import '../redux/sources/chapter.dart';
import '../redux/sources/sources.dart';

enum Resolvers {
  @JsonValue("ao3")
  ao3,
}

abstract class Resolver {
  Future<Work> getWork(String id);
  Future<Document> getChapterText(String workId, String chapterId);
}
