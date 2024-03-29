import 'package:flutter/material.dart';
import 'package:practice1/Localization/GlobalLocalization.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String VIETNAM = 'vi';
const String FA = 'fa';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  print("[Debug] setLocale $languageCode");
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  print("[Debug] language code $languageCode");
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case VIETNAM:
      return Locale(VIETNAM, "VN");
    case FA:
      return Locale(FA, "AF");
    default:
      return Locale(ENGLISH, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  String result;
  if (GlobalLocalization.of(context)?.translate(key) != null) {
    String? aNullableString = GlobalLocalization.of(context)?.translate(key);
    result = aNullableString.toString();
  } else {
    result = "String null";
  }
  return result;
}
