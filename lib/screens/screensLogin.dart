import 'package:flutter/material.dart';
import 'package:integracion_app/screens/screensCaballero.dart';
import 'package:integracion_app/widgets/inkewellCard.dart';
import 'package:integracion_app/widgets/navigationBar.dart';
import '../widgets/cardContainer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
       // image: DecorationImage(
       //   image: AssetImage('assets/dressmaker.png'),
       //   fit: BoxFit.cover
       // )
      ),
      child: Scaffold(backgroundColor: Colors.transparent,
      body: ListView(children: [const SizedBox(height: 80),
      
      const SizedBox(height: 20),
      Padding(padding: const EdgeInsets.all(30),
      child: Container(
        decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow:const [BoxShadow(color: Colors.grey,
        blurRadius: 10,
        offset: Offset(0,5)
        )
        ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height:30),
             Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/swaglabs.png', width: 80, )
      ]
      ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('REGISTRO DE USUARIO', style: TextStyle(
                fontSize: 20
              ),),
            ),
            const SizedBox(height:30),
            const Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'User',
                prefixIcon: Icon(Icons.person),
                contentPadding: EdgeInsets.all(10),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2
                    )
                    ),
              ),
            ),
            ),
            const SizedBox(height: 40,),
             const Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.security),
                contentPadding: EdgeInsets.all(10),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2
                    )
                    ),
              ),
            ),
            ),
            const SizedBox(height: 60),
            InkWell(
              onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationBarIntegration()),
    );
  },
              child: Container(
                decoration: const BoxDecoration(
                color: Color.fromRGBO(81, 171, 216, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('LOGIN NOW', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      ),
                    )
                  ],
              )
            )
            ),
            ],
        ),
      ),)
      ]
      ),
      ),
    );
  }
}
