// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:practice1/Localization/LanguageLocale.dart';
import 'package:practice1/main.dart';
import 'package:practice1/classes/language.dart';

class HelloWorld extends StatefulWidget {
  // static void setLocale(BuildContext context, Locale newLocale) {
  //   _HelloWorldState? state = context.findAncestorStateOfType<_HelloWorldState>();
  //   state?.setLocale(newLocale);
  // }
  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  Locale _locale = Locale("en");
  String message = "Hellow World";

  // Initial Selected Value
  String dropdownvalue = 'en';

  // List of items in our dropdown menu
  var items = [
    'en',
    'vi',
    'fa',
  ];

  void _changeLanguage(Language? language) async {
    _locale = await setLocale(language!.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color?>(Colors.blue[800])),
        ),
      );
    } else {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(getTranslated(context, 'message')),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<Language>(
              iconSize: 30,
              hint: Text(getTranslated(context, 'change_language')),
              onChanged: (Language? language) {
                _changeLanguage(language);
                message = getTranslated(context, 'message');
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ]);
    }
  }
}
