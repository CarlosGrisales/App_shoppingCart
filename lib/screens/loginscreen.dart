import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:integracion_app/screens/shoppingscreen.dart';

class ScreenLogin1 extends StatelessWidget {
  const ScreenLogin1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 102, 119),
        scrolledUnderElevation: 50,
        title: const Text(""),
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
            color: Color.fromARGB(255, 3, 102, 119),
            padding: const EdgeInsets.symmetric(horizontal: 43.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'INGRESO DE USUARIO',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'User',
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2)),
                      ),
                      validator: (value) {
                        if (value != "admon") {
                          return 'Usuario Incorrecto';
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
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.security),
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2)),
                      ),
                      validator: (value) {
                        if (value != "123") {
                          return "clave Incorrecta";
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
                        "log In",
                        style: TextStyle(
                            color: Color.fromRGBO(40, 48, 52, 1),
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
