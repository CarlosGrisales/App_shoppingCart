import 'package:flutter/material.dart';
import 'package:integracion_app/widgets/cardMenu.dart';
import 'package:integracion_app/widgets/inkewellCard.dart';
import '../widgets/cardContainer.dart';

class ScreenUtilidades extends StatelessWidget {
  const ScreenUtilidades({super.key});

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
    return SafeArea(
       child: Container(
      padding: EdgeInsets.all(10),
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
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                color: Color(0x000005cc),
                blurRadius: 30,
                offset: Offset(10,10)
              )]
            ),
                child: Column(
              children: <Widget>[
                Image.asset("assets/"+zapatos[index].imagen),
                Text(zapatos[index].nombre,style: TextStyle(fontWeight: FontWeight.bold),),
                Padding(padding: EdgeInsets.only(top:20),
                child: Text("S/"+zapatos[index].precio.toString(),style: TextStyle(fontSize: 16),)),
              ],
            )
          );
        },
      ),
     )
      );
    
  }
}
