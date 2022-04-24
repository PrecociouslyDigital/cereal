import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

enum Theme {
  @JsonValue("dark")
  dark,
  @JsonValue("light")
  light,
}

@freezed
@JsonSerializable()
class Settings with _$Settings {
  const factory Settings({required Theme theme}) = _Settings;
  static const defaultSettings = Settings(theme: Theme.light);
}
