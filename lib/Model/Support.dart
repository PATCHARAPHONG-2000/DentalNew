import 'dart:io';

import 'package:dental_news/Widget/usermanual.dart';
import 'package:dental_news/utils/utils.dart';
import 'package:dental_news/Home/Call/caal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ThemeMode/ThemeProvider.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  //
  bool _languageSwitchValue = false;
  SharedPreferences? _preferences;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  void dispose() {
    _preferences;
    super.dispose();
  }

  Future<void> _loadPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    _languageSwitchValue = _preferences!.getBool('languageSwitchValue') ?? true;
    setState(() {});
  }

  void changeLanguage(bool value) async {
    if (_languageSwitchValue != value) {
      setState(() {
        _languageSwitchValue = value;
      });

      if (context.locale.languageCode == 'en') {
        await context.setLocale(Locale('th'));
      } else {
        await context.setLocale(Locale('en'));
      }

      await _preferences!.setBool('languageSwitchValue', value);
    }
  }

  Widget _languageSwitch() {
    if (Platform.isIOS) {
      return CupertinoSwitch(
        onChanged: (value) => changeLanguage(value),
        value: _languageSwitchValue,
      );
    } else {
      return Switch(
        onChanged: (value) => changeLanguage(value),
        value: _languageSwitchValue,
      );
    }
  }

  Widget _themeSwitch() {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            onChanged: (value) {
              themeProvider.changeTheme();
            },
            value: !themeProvider.isDarkTheme,
            activeColor: Theme.of(context).hoverColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
            child: Column(
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  maxRadius: 70,
                  backgroundImage: AssetImage('image/APP.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'D E N T A L  N E W S',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: color.app),
                  ),
                ),
                const Divider(
                  height: 50,
                ),
                ListTile(
                    title: Text(
                      tr('app.Language'),
                      style: GoogleFonts.k2d(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).splashColor,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      tr('app.LanguageDetel'),
                      style: GoogleFonts.k2d(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).splashColor,
                        ),
                      ),
                    ),
                    leading: Image.asset(
                      'image/language.png',
                      width: 35,
                      height: 35,
                    ),
                    trailing: _languageSwitch(),
                    onTap: () {}),
                Divider(),
                ListTile(
                    title: Text(
                      tr('app.Theme'),
                      style: GoogleFonts.k2d(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).splashColor,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      tr('app.Themesetting'),
                      style: GoogleFonts.k2d(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).splashColor,
                        ),
                      ),
                    ),
                    leading: Image.asset(
                      'image/theme.png',
                      width: 35,
                      height: 35,
                    ),
                    trailing: _themeSwitch(),
                    onTap: () {}),
                Divider(),
                ListTile(
                    title: Text(
                      tr('app.Manual'),
                      style: GoogleFonts.k2d(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).splashColor,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      tr('app.ManualTitle'),
                      style: GoogleFonts.k2d(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).splashColor,
                        ),
                      ),
                    ),
                    leading: Image.asset(
                      'image/setting.png',
                      width: 35,
                      height: 35,
                    ),
                    trailing: Icon(Icons.chevron_right, color: color.app),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Usermanual();
                      }));
                    }),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Call();
                        },
                      ),
                    );
                  },
                  title: Text(
                    tr('app.Help'),
                    style: GoogleFonts.k2d(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).splashColor,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    tr('app.HelpTile'),
                    style: GoogleFonts.k2d(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).splashColor,
                      ),
                    ),
                  ),
                  leading: Image.asset(
                    'image/service.png',
                    width: 35,
                    height: 35,
                  ),
                  trailing: Icon(Icons.chevron_right, color: color.app),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
