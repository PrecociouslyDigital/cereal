import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import 'chapter.dart';

part 'works.g.dart';
part 'works.freezed.dart';

typedef Works = IMap<String, Work>;

@freezed
class Work with _$Work {
  const factory Work({
    required String id,
    required String site,
    required String title,
    required String author,
    required ISet<String> tags,
    required Chapters chapters,
  }) = _Work;
  factory Work.fromJson(Json json) => _$WorkFromJson(json);
}

class AddWorkAction {
  final Work work;
  AddWorkAction(this.work);
}

Works addWorkReducer(Works works, AddWorkAction action) =>
    works.add(action.work.id, action.work);

final Reducer<Works> worksReducer = combineReducers([
  TypedReducer(addWorkReducer),
]);
