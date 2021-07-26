import 'package:centauros_app/app/settings/app_settings.dart';
import 'package:centauros_app/app/settings/application.dart';
import 'package:flutter/material.dart';

import 'app/centauros_app.dart';


void main() {
WidgetsFlutterBinding.ensureInitialized();
var appSettings = AppSettings(
 apiUrl: 'https://centauros.herokuapp.com/',
);
Application().appSettings = appSettings;
Application().environment = '';

runApp(CentaurosApp());
}