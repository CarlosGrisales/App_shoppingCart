import 'package:flutter/material.dart';
import '../widgets/card.dart';
import '../widgets/menuDrawer.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 102, 119),
          scrolledUnderElevation: 50,
          title: const Text("STORE"),
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
        ),
        drawer: MenuDrawer(),
        body: TabBarView(
          children:<Widget> [
            Container( padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: caballero.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.2),
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
                ],
              ));
        },
      ),),
            Container(padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: dama.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.2),
            crossAxisSpacing: 10,
            mainAxisSpacing: 2),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(
                color: Color(0x000005cc),
                blurRadius: 30,
                offset: Offset(10,10)
              )]
            ),
                child: Column(
              children: <Widget>[
                 Image.asset("assets/${dama[index].imagen}"),
                Text(dama[index].nombre,style: const TextStyle(fontWeight: FontWeight.bold),),
                Padding(padding: const EdgeInsets.only(top:20),
                child: Text("S/${dama[index].precio}",style: const TextStyle(fontSize: 16),)),
              ],
            )
          );
        },
      ),),
            Container(padding: const EdgeInsets.all(10),
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
              boxShadow: const [BoxShadow(
                color: Color(0x000005cc),
                blurRadius: 30,
                offset: Offset(10,10)
              )]
            ),
                child: Column(
              children: <Widget>[
                Image.asset("assets/${zapatos[index].imagen}"),
                Text(zapatos[index].nombre,style: const TextStyle(fontWeight: FontWeight.bold),),
                Padding(padding: const EdgeInsets.only(top:20),
                child: Text("S/${zapatos[index].precio}",style: const TextStyle(fontSize: 16),)),
              ],
            )
          );
        },
      ),),
          ]),
      ),
    );
  }
}

