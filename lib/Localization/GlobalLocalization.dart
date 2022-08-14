import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer';

class GlobalLocalization {
  GlobalLocalization(this.locale);

  final Locale locale;
  static GlobalLocalization? of(BuildContext context) {
    return Localizations.of<GlobalLocalization>(context, GlobalLocalization);
  }

  late Map<String, String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues =
        await rootBundle.loadString('lib/Language/${locale.languageCode}.json');
    print("[Debug] load : lib/Language/${locale.languageCode}.json");
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedValues[key];
  }

  // static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<GlobalLocalization> delegate =
      _GlobalLocalizationsDelegate();
}

class _GlobalLocalizationsDelegate
    extends LocalizationsDelegate<GlobalLocalization> {
  const _GlobalLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'vi', 'fa'].contains(locale.languageCode);
  }

  @override
  Future<GlobalLocalization> load(Locale locale) async {
    GlobalLocalization localization = new GlobalLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<GlobalLocalization> old) => false;
}
