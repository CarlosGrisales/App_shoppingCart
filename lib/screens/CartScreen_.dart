import 'package:flutter/material.dart';
import 'package:integracion_app/carrito/carrito.dart';
import 'package:provider/provider.dart';
import '../widgets/card.dart';
import '../widgets/menuDrawer.dart';
import 'formCompra.dart';
import 'loginscreen.dart';

class Screencart extends StatefulWidget {
  const Screencart({super.key});

  @override
  State<Screencart> createState() => _ScreencartState();
}

class _ScreencartState extends State<Screencart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (context, carrito, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 102, 119),
          title: Text("Pedidos"),
          elevation: 0,
        ),
        body: Container(
            child: carrito.items.length == 0
                ? Center(
                    child: Text("No tiene Pedidos"),
                  )
                : ListView(children: [
                    Column(
                      children: <Widget>[
                        for (var item in carrito.items.values)
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                  "assets/" + item.imagen,
                                  width: 100,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    height: 100,
                                    child: Column(
                                      children: <Widget>[
                                        Text(item.nombre),
                                        Text(item.precio.toString() +
                                            " * " +
                                            item.unidad),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                                child: IconButton(
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                setState(() {
                                                  carrito
                                                      .decrementarCantidadItem(
                                                          item.id);
                                                });
                                              },
                                            )),
                                            Container(
                                              child: Center(
                                                  child: Text(item.cantidad
                                                      .toString())),
                                            ),
                                            Container(
                                                child: IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  carrito
                                                      .incrementarCantidadItem(
                                                          item.id);
                                                });
                                              },
                                            )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 90,
                                  margin: EdgeInsets.only(right: (8)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(69, 3, 102, 119),
                                  ),
                                  child: Center(
                                    child: Text("S/" +
                                        (item.precio * item.cantidad)
                                            .toString()),
                                  ),
                                )
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(children: <Widget>[
                            Expanded(
                              child: Text("Subtotal: "),
                            ),
                            Text("s/." + carrito.subTotal.toStringAsFixed(3)),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(children: <Widget>[
                            Expanded(
                              child: Text("Impuesto"),
                            ),
                            Text("S/." + carrito.impuesto.toStringAsFixed(3)),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(children: <Widget>[
                            Expanded(
                              child: Text("Total"),
                            ),
                            Text("S/." + carrito.total.toStringAsFixed(3)),
                          ]),
                        ),
                      ],
                    )
                  ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           var alert = SnackBar(
                            content: Text('No puedes hacer Checkout, por favor llene el carrito'));
                        carrito.numeroItems != 0
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext) => FormCompra()))
                            : ScaffoldMessenger.of(context)
                                .showSnackBar(alert);
          },
          backgroundColor: Color.fromARGB(255, 3, 102, 119),
          child: Icon(
            Icons.send,
            color: Colors.amber,
          ),
        ),
      );
    });
  }
}
