import 'dart:convert';
import 'package:flutter_pensil_app/model/actor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {
  SharedPrefrenceHelper._internal();
  static final SharedPrefrenceHelper _singleton =
      SharedPrefrenceHelper._internal();

  factory SharedPrefrenceHelper() {
    return _singleton;
  }
  Future<bool> setAccessToken(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.AccesssToken.toString(), value);
  }

  Future<String> getAccessToken() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.AccesssToken.toString());
  }

  Future<bool> setUserName(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.UserName.toString(), value);
  }

  Future<String> getUserName() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.UserName.toString());
  }

  Future<String> getCountryIsoCode() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.CountryISOCode.toString());
  }

  Future<bool> setCountryIsoCode(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.CountryISOCode.toString(), value);
  }

  Future<String> getLanguageCode() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.LanguageCode.toString());
  }

  Future<bool> setLanguageCode(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.LanguageCode.toString(), value);
  }
  Future<Null> cleaPrefrenceValues()async{
    await (SharedPreferences.getInstance())..clear();
  }
  Future<void> saveUserProfile(ActorModel user) async {
   return (await SharedPreferences.getInstance())
         .setString(UserPreferenceKey.UserProfile.toString(),json.encode(user.toJson()));
  }

  Future<ActorModel> getUserProfile() async {
    final jsonString = (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.UserProfile.toString());
    return ActorModel.fromJson(json.decode(jsonString));
  }
  Future<bool> isStudent() async {
    final jsonString = (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.UserProfile.toString());
    return ActorModel.fromJson(json.decode(jsonString)).isStudent;
  }
}

enum UserPreferenceKey {
  LanguageCode,
  CountryISOCode,
  AccesssToken,
  UserProfile,
  UserName
}
