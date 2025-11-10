import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier{
  static final ThemeController instance = ThemeController._();
  ThemeController._();
  static const _key="theme_mode";
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode=>_mode;
  Future<void> init()async {
    final prefs=await SharedPreferences.getInstance();
    final raw=prefs.getString(_key);
    switch(raw){
      case "light":
        _mode=ThemeMode.light;
        break;
      case "dark":
        _mode=ThemeMode.dark;
        break;
      default:
        _mode =ThemeMode.system;

    }
  }
Future<void>persists(ThemeMode mode)async {
  final prefs = await SharedPreferences.getInstance();
  final value = switch(_mode){
    ThemeMode.light => "light",
    ThemeMode.dark => "dark",
    _ => "system"
  };
  await prefs.setString(_key, value);
}
void toggle(){
    _mode=switch(_mode){
      ThemeMode.light=>ThemeMode.dark,
      ThemeMode.dark=>ThemeMode.light,
      ThemeMode.system=>ThemeMode.light
    };
    persists(_mode);
    notifyListeners();
}
}