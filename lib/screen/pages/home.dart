import 'package:flutter/material.dart';
import 'package:practice1/Localization/LanguageLocale.dart';
import 'package:practice1/classes/language.dart';
import 'package:practice1/main.dart';
import 'package:practice1/CustomRouter/Router_Constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Locale _locale = Locale("en");

  void _changeLanguage(Language? language) async {
    _locale = await setLocale(language!.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(getTranslated(context, "title")),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8),
                child: DropdownButton<Language>(
                  icon: Icon(Icons.language, color: Colors.white),
                  onChanged: (Language? language) {
                    _changeLanguage(language);
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
                ))
          ]),
      drawer: Drawer(
        child: _drawerList(),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          child: Center(
            child: Text(
              getTranslated(context, 'personal_information'),
              // DemoLocalization.of(context).translate('personal_information'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextFormField(
          validator: (val) {
            if (val!.isEmpty) {
              return getTranslated(context, 'required_field');
              // return DemoLocalization.of(context).translate('required_fiedl');
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: getTranslated(context, 'name'),
            hintText: getTranslated(context, 'name_hint'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: (val) {
            if (val!.isEmpty) {
              return getTranslated(context, 'required_field');
              // return DemoLocalization.of(context).translate('required_fiedl');
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: getTranslated(context, 'email'),
            hintText: getTranslated(context, 'email_hint'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: (val) {
            if (val!.isEmpty) {
              return getTranslated(context, 'required_field');
              // return DemoLocalization.of(context).translate('required_fiedl');
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: getTranslated(context, 'email'),
            hintText: getTranslated(context, 'email_hint'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: getTranslated(context, 'date_of_birth')),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year),
              lastDate: DateTime(DateTime.now().year + 20),
            );
          },
        ),
        MaterialButton(
          onPressed: () {
            // if (_key.currentState.validate()) {
            //   _showSuccessDialog();
            // }
          },
          height: 50,
          shape: StadiumBorder(),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Text(
              getTranslated(context, 'submit_info'),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ]),
    );
  }

  Container _drawerList() {
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'about_us'),
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'settings'),
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}
