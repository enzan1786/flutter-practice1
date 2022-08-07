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
      SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "Welcome Back",
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(28),
            fontWeight: FontWeight.bold,
          ),
        ),
      SafeArea(
      child: 
        SizedBox(
          width: SizeConfig.screenWidth * 0.4,
          child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                // decoration: BoxDecoration(
                //   color: Color(0xFFF5F6F9),
                //   borderRadius: BorderRadius.circular(15),
                // ),
                child: Center(
                  child: Text( 
                    "Sign in with your email and password  \nor continue with social media"),
                  ),
                ),
              ),
            ),
          ),
        // SizedBox(height: SizeConfig.screenHeight * 0.08),
        // SignForm(),
        // SizedBox(height: SizeConfig.screenHeight * 0.08),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SocalCard(
        //       icon: "assets/icons/google-icon.svg",
        //       press: () {},
        //     ),
        //     SocalCard(
        //       icon: "assets/icons/facebook-2.svg",
        //       press: () {},
        //     ),
        //     SocalCard(
        //       icon: "assets/icons/twitter.svg",
        //       press: () {},
        //     ),
        //   ],
        // ),
        // SizedBox(height: getProportionateScreenHeight(20)),
        // NoAccountText(),
        HelloWorld(),
      ],

    );
  }
}
