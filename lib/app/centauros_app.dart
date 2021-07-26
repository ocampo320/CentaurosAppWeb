import 'package:centauros_app/app/settings/app_localization.dart';
import 'package:centauros_app/views/clients_page.dart';
import 'package:centauros_app/views/contactPage.dart';
import 'package:centauros_app/views/drawer_page.dart';
import 'package:centauros_app/views/event_page.dart';
import 'package:centauros_app/views/home_page.dart';
import 'package:centauros_app/views/notification_page.dart';
import 'package:centauros_app/views/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CentaurosApp extends StatelessWidget {
  static const MaterialColor _primarySwatch = MaterialColor(
    _primarySwatchValue,
    <int, Color>{
      50: Color(0xFFE9ECFE),
      100: Color(0xFFC9D0FD),
      200: Color(0xFFA5B0FC),
      300: Color(0xFF8090FB),
      400: Color(0xFF6579FA),
      500: Color(_primarySwatchValue),
      600: Color(0xFF4359F8),
      700: Color(0xFF3A4FF7),
      800: Color(0xFF3245F6),
      900: Color(0xFF2233F5),
    },
  );
  static const int _primarySwatchValue = 0xFF0033A0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', ''),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: HomePage(),
       routes:  {
       PageRoutes.home: (context) => HomePage(),
       PageRoutes.contact: (context) => ContactPage(),
       PageRoutes.event: (context) => EventPage(),
       PageRoutes.profile: (context) => ProfilePage(),
       PageRoutes.notification: (context) => NotificationPage(),
       PageRoutes.clients: (context) => ClientPage(),
     },
      theme: ThemeData(
          cupertinoOverrideTheme: CupertinoThemeData(
            brightness: Brightness.light,
          ),
          fontFamily: 'Roboto',
          brightness: Brightness.light,
          primarySwatch: _primarySwatch,
          buttonColor: _primarySwatch),
    );
  }
}
