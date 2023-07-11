import 'package:flutter/material.dart';


class InkWellCard extends StatefulWidget {
  final String titleCard;
  final String subtitlecard;
  final Image imageCard;
  final Widget rutaPage;

  InkWellCard(
      {super.key,
      required this.titleCard,
      required this.subtitlecard,
      required this.imageCard,
      required this.rutaPage
      });
  
  @override
  State<InkWellCard> createState() => _InkWellCardState();
}

class _InkWellCardState extends State<InkWellCard> {
  double sideLength = 170;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(05),
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
      height: sideLength,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeIn,
      child: Material(
        color: Color.fromARGB(232, 178, 218, 250),
        child: InkWell(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.titleCard,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.subtitlecard,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: widget.imageCard,
            )
          ]),
          onTap: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget.rutaPage),
  );
            setState(() {
              sideLength == 170 ? sideLength = 173 : sideLength = 170;
            });
          },
        ),
      ),
    );
  }
}
