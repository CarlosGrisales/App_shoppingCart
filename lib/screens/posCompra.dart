import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:integracion_app/screens/shoppingscreen.dart';

class PosCompra extends StatelessWidget {
  final String _nombreUs;
  final String _apellidoUs;
  final String _direccionUs;
  final String _postalUs;
  const PosCompra(this._nombreUs, this._apellidoUs, this._direccionUs,
      this._postalUs,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 102, 119),
        scrolledUnderElevation: 50,
        title: const Text("Compra OK"),
        elevation: 0,
      ),
      body: Center(
        child: Column(children: [
          Text("GRACIAS POR TU COMPRA"),
          Text(_nombreUs)
        ]
      ),),
    );
  }
}
