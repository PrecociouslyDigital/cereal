import 'package:cereal/resolvers/ao3/ao3.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "package:html/dom.dart";

import '../redux/sources/chapter.dart';
import '../redux/sources/sources.dart';

enum Resolvers {
  @JsonValue("ao3")
  ao3(AO3Resolver());

  const Resolvers(this.resolver);
  final Resolver resolver;
}

abstract class Resolver {
  const Resolver();
  Future<Work> getWork(String id);
  Future<Element> getChapterText(String workId, String chapterId);
}
