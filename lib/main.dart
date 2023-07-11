import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:integracion_app/screens/authentication.dart';
import 'package:integracion_app/screens/screensCaballero.dart';
import 'screens/screensLogin.dart';
import 'widgets/navigationBar.dart';
import 'config/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';


void main()  => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return 
    MaterialApp(
      title: 'TIENDA',
      theme: AppTheme(selectedColor: 2).theme(),
      debugShowCheckedModeBanner: false,
      home: const ScreenLogin()
    );
  }
}

