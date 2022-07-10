import 'package:flutter/material.dart';
import 'package:practice1/size_config/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {

  }

  void removeError({String? error}) {

  }

  void showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () { },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => showAlertDialog(context),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            // FormError(errors: errors),
            // SizedBox(height: getProportionateScreenHeight(20)),
            // DefaultButton(
            //   text: "Continue",
            //   press: () {
            //     if (_formKey.currentState!.validate()) {
            //       _formKey.currentState!.save();
            //       // if all are valid then go to success screen
            //       KeyboardUtil.hideKeyboard(context);
            //       Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            //     }
            //   },
            // ),
          ],
        ),
      );
      
  }

  TextFormField buildPasswordFormField() {
    return TextFormField();
      
  }

  TextFormField buildEmailFormField() {
    return TextFormField();
      
  }
}
