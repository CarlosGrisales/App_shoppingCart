import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:integracion_app/screens/shoppingscreen.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../config/Utils/responsive.dart';

class ScreenLogin1 extends StatelessWidget {
  const ScreenLogin1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 50,
        title: const Text(""),
        elevation: 0,
      ),
      body: FormularioIngreso(),
    );
  }
}

class FormularioIngreso extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  FormularioIngreso({super.key});
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
        body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        //GestureDetectos es para quitar el teclado el foco
        //Single es pra que al salir los teclado no se suba
        //es necesario cambiar el infinito de el containes
        child: SingleChildScrollView(
          child: Container(
            color:Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 43.0),
            child: Form( //formulario de ingreso
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "•",
                            style:
                                TextStyle(fontSize: 80, color: Colors.orange),
                          ),
                          Text("   "),
                          Text("•",
                              style:
                                  TextStyle(fontSize: 80, color: Colors.grey)),
                        ],
                      ),
                      SizedBox(
                        height: responsive.dp(3),
                      ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child:Text(
                      'Ingresa a tu cuenta',
                      style: TextStyle(
                        fontSize: responsive.dp(2.0), 
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    ),
                  ),
                  SizedBox(height: responsive.dp(2)),
                  Text('Correo Electronico/Usuario', 
                  style: TextStyle(fontSize: responsive.dp(1.7), 
                  color: Colors.grey),),
                  TextFormField(
                      autofocus: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),),
                       
                        /*hintText: 'User',
                        //prefixIcon: Icon(Icons.person),
                         
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),*/
                      ),
                      validator: (value) {
                        if (value != "admon") {
                          return 'Usuario Incorrecto';
                        }
                        return null;
                      },
                    ),
                  const SizedBox(height: 30),
                  Text('Contraseña', 
                  style: TextStyle(fontSize: responsive.dp(1.7), 
                  color: Colors.grey),),
                  TextFormField(
                      autofocus: false,
                      decoration: const InputDecoration(
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                       /* hintText: 'Password',
                        prefixIcon: Icon(Icons.security),
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),*/
                      ),
                      validator: (value) {
                        if (value != "123") {
                          return "Clave Incorrecta"
                          ;
                        }
                        return null;
                      },
                    ),
                  SizedBox(height: responsive.dp(6)),
                SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  shape: RoundedRectangleBorder( //bordes del boton
                  borderRadius: BorderRadius.circular(20)),    
                  color: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Siguiente",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.3,
                        fontSize:
                            responsive.dp(responsive.isTablet ? 1.7 : 1.9),
                        fontWeight: FontWeight.bold),
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
                   SizedBox(height: responsive.dp(5)),
                   Center(child:
                    Image.asset("assets/logo_icono_principal.png"),
                   ),
                   
             SizedBox(height: responsive.dp(2)),
             const Divider(color: Colors.black26,),
             const Center(child:  Text(
                "¿No tienes acceso?, solicita tus credenciales\n a la persona encargada",
                style: TextStyle(
                 
                  fontSize: 14,
                  color: Colors.black38,
                  //fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),),
             Center( child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onPrimary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      side: const BorderSide(
                        width: 1.0,
                        color: Colors.transparent,
                      )),
                  child: const Text("Conoce las políticas de privacidad",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      )),
                  onPressed: () {
                    launchUrlString("https://www.trackmile.com.co/privacy-policy");
                  }),),
                ],
              ),
            )
            )
        )
    )
    );
  }
}
