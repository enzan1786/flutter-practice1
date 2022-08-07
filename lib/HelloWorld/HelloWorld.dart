// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:practice1/Localization/LanguageLocale.dart';

class HelloWorld extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _HelloWorldState? state = context.findAncestorStateOfType<_HelloWorldState>();
    state?.setLocale(newLocale);
  }
  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  Locale _locale = Locale("en");
  String message = "Hellow World";
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  // Initial Selected Value
  String dropdownvalue = 'en';  
 
  // List of items in our dropdown menu
  var items = [   
    'en',
    'vi',
  ];

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
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
    }
    else {
      
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text(message),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  
                  // Initial Value
                  value: dropdownvalue,
                    
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),   
                    
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      this.changeLanguage(Locale(newValue));
                      setLocale(Locale(newValue));
                      message = getTranslated(context, "message");
                      print("[debug]: $message"); 
                      setState(() {});
                  });
                },
              ),
            ],
          ),
        ]
      );
    }
  }
}