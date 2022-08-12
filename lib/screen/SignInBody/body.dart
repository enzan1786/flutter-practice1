import 'package:flutter/material.dart';
import 'package:practice1/HelloWorld/HelloWorld.dart';
import 'package:practice1/size_config/size_config.dart';
import 'sign_form.dart';
import '../../Components/SocalCard.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        HelloWorld(),
      ],
    );
  }
}
