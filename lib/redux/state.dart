import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'settings/settings.dart';
import 'sources/sources.dart';

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
