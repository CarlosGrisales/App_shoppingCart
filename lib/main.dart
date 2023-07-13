import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:integracion_app/carrito/carrito.dart';
import 'package:integracion_app/screens/authentication.dart';
import 'package:integracion_app/screens/loginscreen.dart';
import 'package:integracion_app/screens/shoppingscreen.dart';
import 'package:provider/provider.dart';
import 'screens/loginscreen.dart';
import 'config/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';


void main()  => runApp(
 ChangeNotifierProvider(
  create: (context) => Carrito(),
  child: const MyApp()
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return 
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TIENDA',
      theme: AppTheme(selectedColor: 5).theme(),
      home: const ScreenLogin1()
    );
  }
}

