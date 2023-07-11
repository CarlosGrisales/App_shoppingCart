import 'package:flutter/material.dart';
import 'package:fancy_containers/fancy_containers.dart';

class CardContainer extends StatelessWidget {
  String titleCard;
  String subtitlecard;
  final Image imageCard;

  CardContainer(
      {super.key, required this.titleCard, required this.subtitlecard, required this.imageCard});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
                      onTap: (){
                 print("Container clicked");   
        },child:
    
    
    Container(
      margin: const EdgeInsets.all(30),
      height: 170,
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromARGB(166, 63, 81, 181), width: 2),
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(232, 178, 218, 250),
            Color.fromARGB(206, 178, 224, 250),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.35, 0.90],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 93, 93, 100),
            offset: Offset(-4, 3),
            blurRadius: 8,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleCard,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text(subtitlecard,)
            ],
          ),
        ),
        SizedBox(
          width: 80,
          height: 80,
          child: imageCard,
        )
      ]),
    )
    );
  }
}
