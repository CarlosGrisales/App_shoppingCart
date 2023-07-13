import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:integracion_app/screens/shoppingscreen.dart';
import 'package:provider/provider.dart';

import '../carrito/carrito.dart';

class PosCompra extends StatelessWidget {
  final String _nombreUs;
  final String _apellidoUs;
  final String _direccionUs;
  final String _postalUs;
  const PosCompra(
      this._nombreUs, this._apellidoUs, this._direccionUs, this._postalUs,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 102, 119),
          scrolledUnderElevation: 50,
          title: const Text("Compra OK"),
          elevation: 0,
        ),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GRACIAS POR TU COMPRA",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(height: 30),
                Text(
                  "Nombre: " +
                      _nombreUs +
                      " " +
                      _apellidoUs +
                      "\nEnvio: " +
                      _direccionUs +
                      "\nPostal: " +
                      _postalUs +
                       "\nTotal: S/."+
                      carrito.total.toStringAsFixed(3),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      );
    }
   );
  }
}
