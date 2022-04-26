import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';
part 'chapter.freezed.dart';

typedef Chapters = IMap<String, Chapter>;

@freezed
@JsonSerializable()
class Chapter with _$Chapter {
  const factory Chapter({
    required String title,
    required int words,
    required int wordsRead,
    required DateTime published,
  }) = _Chapter;
}

@freezed
class ReadChapterAction with _$ReadChapterAction {
  const factory ReadChapterAction(
      {required String id, required int wordsRead}) = _ReadChapterAction;

  static Chapters action(Chapters chapters, ReadChapterAction action) {
    return chapters.update(
        action.id, (chapter) => chapter.copyWith(wordsRead: action.wordsRead));
  }
}
