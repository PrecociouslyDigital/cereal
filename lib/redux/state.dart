import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'settings/settings.dart';
import 'sources/works.dart';

part 'state.g.dart';
part 'state.freezed.dart';

typedef Json = Map<String, dynamic>;

@freezed
class State with _$State {
  const factory State({
    required Works works,
    required Settings settings,
  }) = _State;

  factory State.fromJson(Json json) => _$StateFromJson(json);
}

State reducer(State state, action) => State(
    settings: settingsReducer(state.settings, action),
    works: worksReducer(state.works, action));
