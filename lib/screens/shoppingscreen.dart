import 'package:flutter/material.dart';
import 'package:integracion_app/carrito/carrito.dart';
import 'package:provider/provider.dart';
import '../widgets/card.dart';
import '../widgets/menuDrawer.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          key: _globalKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 3, 102, 119),
            scrolledUnderElevation: 50,
            title: const Text("Online Store"),
            elevation: 0,
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text("Caballero"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text("Dama"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text("Zapatos"),
                ),
              )
            ]),
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  IconButton(
                      icon: Image.asset('assets/sewing4.png', width: 30),
                      padding: const EdgeInsets.only(top: 15, right: 15),
                      onPressed: () {
                        var snackBar = SnackBar(content: Text('por favor llene el carrito'));
                        var snackBar2 = SnackBar(content: Text('Carrito Lleno'));
                        carrito.numeroItems != 0
                            ?
                            ScaffoldMessenger.of(context).showSnackBar(snackBar2)
                            : ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }),
                  Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4)),
                        constraints:
                            const BoxConstraints(minHeight: 14, minWidth: 14),
                        child: Text(
                          carrito.numeroItems.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ))
                ],
              )
            ],
          ),
          drawer: MenuDrawer(),
          body: TabBarView(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: caballero.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.1),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x000005cc),
                                blurRadius: 30,
                                offset: Offset(10, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Image.asset("assets/${caballero[index].imagen}"),
                          Text(
                            caballero[index].nombre,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "S/${caballero[index].precio}",
                                style: const TextStyle(fontSize: 16),
                              )),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                disabledForegroundColor:
                                    Colors.red.withOpacity(0.38),
                                disabledBackgroundColor:
                                    Colors.red.withOpacity(0.12)),
                            onPressed: () {
                              setState(() {
                                carrito.agregarItem(
                                    caballero[index].id.toString(),
                                    caballero[index].nombre,
                                    caballero[index].precio,
                                    "1",
                                    caballero[index].imagen,
                                    1);
                              });
                            },
                            child: const Text('Agregar'),
                          )
                        ],
                      ));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: dama.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.1),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x000005cc),
                                blurRadius: 30,
                                offset: Offset(10, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Image.asset("assets/${dama[index].imagen}"),
                          Text(
                            dama[index].nombre,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "S/${dama[index].precio}",
                                style: const TextStyle(fontSize: 16),
                              )),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                disabledForegroundColor:
                                    Colors.red.withOpacity(0.38),
                                disabledBackgroundColor:
                                    Colors.red.withOpacity(0.12)),
                            onPressed: () {
                              setState(() {
                                carrito.agregarItem(
                                    dama[index].id.toString(),
                                    dama[index].nombre,
                                    dama[index].precio,
                                    "1",
                                    dama[index].imagen,
                                    1);
                              });
                            },
                            child: const Text('Agregar'),
                          )
                        ],
                      ));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: zapatos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.3),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x000005cc),
                                blurRadius: 30,
                                offset: Offset(10, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Image.asset("assets/${zapatos[index].imagen}"),
                          Text(
                            zapatos[index].nombre,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "S/${zapatos[index].precio}",
                                style: const TextStyle(fontSize: 16),
                              )),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                disabledForegroundColor:
                                    Colors.red.withOpacity(0.38),
                                disabledBackgroundColor:
                                    Colors.red.withOpacity(0.12)),
                            onPressed: () {
                              setState(() {
                                carrito.agregarItem(
                                    zapatos[index].id.toString(),
                                    zapatos[index].nombre,
                                    zapatos[index].precio,
                                    "1",
                                    zapatos[index].imagen,
                                    1);
                              });
                            },
                            child: const Text('Agregar'),
                          )
                        ],
                      ));
                },
              ),
            ),
          ]),
        ),
      );
    });
  }
}
