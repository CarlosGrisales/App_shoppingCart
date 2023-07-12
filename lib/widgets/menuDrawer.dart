import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integracion_app/carrito/carrito.dart';
import 'package:integracion_app/screens/loginscreen.dart';
import 'package:integracion_app/screens/shoppingscreen.dart';


class MenuDrawer extends StatelessWidget {
  MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Agrega un ListView al drawer. Esto asegura que el usuario pueda desplazarse
        // a través de las opciones en el Drawer si no hay suficiente espacio vertical
        // para adaptarse a todo.
        child: ListView(
      // Importante: elimina cualquier padding del ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.deepPurpleAccent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
            Image.asset('assets/man.png', height: 70,), 
            const Text('Usuario'),
            const Text('@usuario.com'),
            ],
            ),
        ),
        ListTile(
          title: const Text('Inicio'),
          onTap: () {
                         
            // Actualiza el estado de la aplicación
            // ...
            // Luego cierra el drawer
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext) => ShoppingScreen()));
          },
          trailing: const Icon(Icons.home),
        ),
        ListTile(
          title: const Text('Carrito'),
          onTap: () {
            // ...
            // Luego cierra el drawer
            //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext) => Carrito()));
          },
          trailing: const Icon(Icons.add_shopping_cart),
        ),
        ListTile(
          title: const Text('Membresia'),
          onTap: () {
            // ...
            // Luego cierra el drawer
            Navigator.pop(context);
          },
          trailing: const Icon(Icons.store),
        ),
        
        ListTile(
          title: const Text('Salir'),
          onTap: () {
            // ...
            // Luego cierra el drawer
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext) => ScreenLogin()));
            //SystemNavigator.pop();
          },
          trailing: const Icon(Icons.exit_to_app),
        ),
      ],
    ));
  }
}
