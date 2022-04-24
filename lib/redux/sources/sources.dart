import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chapter.dart';

part 'sources.g.dart';
part 'sources.freezed.dart';

typedef Works = IMap<String, Work>;

@freezed
@JsonSerializable()
class Work with _$Work {
  const factory Work({
    required String id,
    required String site,
    required String title,
    required String author,
    required ISet<String> tags,
    required Chapters chapters,
  }) = _Work;
}
