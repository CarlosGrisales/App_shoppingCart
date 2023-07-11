
import 'package:flutter/material.dart';
import 'package:integracion_app/screens/screensDama.dart';
import 'package:integracion_app/screens/screensCaballero.dart';
import 'package:flutter_animated_icons/flutter_animated_icons.dart';
import 'package:integracion_app/screens/screensZapatos.dart';
import 'package:integracion_app/widgets/menuDrawer.dart';

class NavigationBarIntegration extends StatefulWidget {
  const NavigationBarIntegration({super.key});

  @override
  State<NavigationBarIntegration> createState() => _NavigationBarIntegrationState();
}

class _NavigationBarIntegrationState extends State<NavigationBarIntegration> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ScreenPerfil(),
    ScreenComercio(),
    ScreenUtilidades(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: MenuDrawer(),   
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 69, 119),
        
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:  [
           Container(
             child: const Text(
              'Tienda Online', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white70, fontSize: 25),),),
           const SizedBox(width: 60,),
          
        Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.topRight,
          child: Image.asset('assets/sewing4.png',
                        width: 30),
    ),
    ]),
      
        centerTitle: true,
      ),
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 3, 69, 119),
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
             icon: Image.asset('assets/suit.png',
            width: 50),
                        label: 'Caballero',
          ),
          BottomNavigationBarItem(
           icon: Image.asset('assets/dress.png',
            width: 50),
            label: 'Damas',
          ),
          BottomNavigationBarItem(
             icon: Image.asset('assets/shoe.png',
                        width: 50),
            label: 'Zapatos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 205, 225, 240),
        onTap: _onItemTapped,
      ),
    );
  }
}


