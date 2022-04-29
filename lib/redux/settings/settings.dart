import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:redux/redux.dart';

import '../state.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

enum Theme {
  @JsonValue("dark")
  dark,
  @JsonValue("light")
  light,
}

@freezed
class Settings with _$Settings {
  const factory Settings({required Theme theme}) = _Settings;
  static const defaultSettings = Settings(theme: Theme.light);
  factory Settings.fromJson(Json json) => _$SettingsFromJson(json);
}

class ChangeThemeAction {
  final Theme theme;
  ChangeThemeAction(this.theme);
}

Settings changeThemeReducer(Settings settings, ChangeThemeAction action) =>
    settings.copyWith(
      theme: action.theme,
    );

Reducer<Settings> settingsReducer =
    combineReducers([TypedReducer(changeThemeReducer)]);
