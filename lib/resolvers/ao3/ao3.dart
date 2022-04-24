import 'package:cereal/redux/sources/sources.dart';
import 'package:cereal/resolvers/http/http_resolver.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../redux/sources/chapter.dart';

final ao3 = HttpResolver(
    domain: "https://archiveofourown.org/",
    createWorkUrl: (id) => "works/$id/navigate",
    createChapterUrl: (workId, chapterId) => "works/$workId/chapters/$chapterId",
    getWorkFromUrl: (workDoc) {
        return Work(id: id, site: "https://archiveofourown.org/", title: "one", author: "two", tags: "three", chapters: IMap<String, Chapters>()))
    }, getChapterFromUrl: (chapterDoc) {
        return null;
 });