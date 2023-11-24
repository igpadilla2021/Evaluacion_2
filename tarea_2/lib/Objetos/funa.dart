import 'package:flutter/material.dart';
import 'package:tarea_2/Pages/detalles.dart';

class Funa extends StatefulWidget {
  String heroTag;
  Funa({required this.heroTag});

  @override
  State<Funa> createState() => _FunaState();
}

class _FunaState extends State<Funa> {

  @override
  Widget build(BuildContext context) {
    double ancho=MediaQuery.of(context).size.width.toDouble();        // Ancho de la pantalla
    double altura=MediaQuery.of(context).size.height.toDouble();      // Largo de la pantalla
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        height: altura*0.13,
        width: ancho*0.9,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Imagen
              Container(
                height: altura*0.13,
                width: altura*0.13,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(132, 157, 177, 1),
                  borderRadius: BorderRadius.circular(30),
                ),    
              ),


              //Texto
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Fecha"),
                  Text("Sector"),
                  Text("Autor")
                ],
              ),

              // Boton
              Container(
                height: altura*0.13,
                width: altura*0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FloatingActionButton(
                  onPressed: (){
                    Navigator.push(   // cambio de pagina
                      context,
                      MaterialPageRoute(builder: (context) => Detalles()),
                    );
                  },
                  heroTag: widget.heroTag,
                  elevation: 0,
                  child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,),backgroundColor: Color.fromRGBO(230, 87, 56, 1),
                ),
              ),
            ],
          ),
        ),
      );
  }
}