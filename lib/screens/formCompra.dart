import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:integracion_app/screens/shoppingscreen.dart';

class FormCompra extends StatelessWidget {
  const FormCompra({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 3, 102, 119),
            scrolledUnderElevation: 50,
            title: const Text("Formulario De Compra"),
            elevation: 0,
       
      ),
      body: formularioIngreso(),
    );
  }
}

class formularioIngreso extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color.fromARGB(22, 198, 227, 231),
            padding: const EdgeInsets.symmetric(horizontal: 43.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                   
                    
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: ' Nombres',
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'PorFavor digite su nombre';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Apellidos',
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'PorFavor digite su apellidos';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Direccion de envio',
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'PorFavor digite la direccion de envio';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Codigo Postal',
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'PorFavor digite su codigo Postal';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.only(top: 43.0),
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: ElevatedButton(
                      child: const Text(
                        "Confirmar Compra",
                        style: TextStyle(
                            color: Color.fromARGB(255, 3, 102, 119),
                            fontFamily: 'RadikalMedium',
                            fontSize: 14),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext) => ShoppingScreen()));
                        }
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
