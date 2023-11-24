import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea_2/Objetos/funa.dart';
import 'package:tarea_2/Pages/inicio.dart';
import 'package:tarea_2/Pages/nueva.dart';

class Listado extends StatefulWidget {
  const Listado({super.key});
  
  @override
  State<Listado> createState() => _ListadoState();
}

class _ListadoState extends State<Listado> {
  
  @override
  Widget build(BuildContext context) {
    List<Widget> listaDeWidgets = [];
    double ancho=MediaQuery.of(context).size.width.toDouble();        // Ancho de la pantalla
    double altura=MediaQuery.of(context).size.height.toDouble();      // Largo de la pantalla
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    for(int c=0; c<8; c=c+1){
      if(c==0){
      listaDeWidgets.add(SizedBox(height: altura*0.03,));
      }
      listaDeWidgets.add(SizedBox(height: altura*0.03,));
      listaDeWidgets.add(Funa(heroTag: c.toString()));
      if(c==7){
        listaDeWidgets.add(SizedBox(height: altura*0.03,));
      }
    };

    return  Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 255, 1),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Stack(
              children: [
                // FIGURA Superior 
                Container(
                  alignment: Alignment.center,
                  width: ancho,
                  height: altura*0.16,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(52, 83, 106, 1), 
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)
                    ),
                  ),
                  child: Text("Lista de funas",style: GoogleFonts.poppins(
                    color: Color.fromRGBO(254, 228, 214, 1), 
                    fontSize: altura*0.03, 
                    fontWeight: FontWeight.w500)
                  ),
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: ancho*0.14,
                      height: altura*0.16,
                      child: IconButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Inicio()),
                        );
                      }, icon: Icon(Icons.arrow_back_ios_new_rounded, color: Color.fromRGBO(254, 228, 214, 1), size: ancho*0.08,)),
                    )
                  ],
                ),
              ],
            ),
            
            //Columna de funas y añadir Funa
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                
                // Lista de Funas
                Container(
                  color: Colors.white,
                  height: altura*0.84,
                  width: ancho,
                  child: SingleChildScrollView(
                    child: Column(
                      children: listaDeWidgets,
                    ),
                  )
                ),

                /* Degrade
                Column(
                  children: [
                    Container(
                      width: ancho,
                      height: altura*0.1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white,Color.fromARGB(255, 231, 231, 231).withOpacity(0)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),                  
                      ),
                    ),
                    Container(
                      width: ancho,
                      height: altura*0.07,
                      color: Colors.white,
                    )
                  ],
                ),   */

                //Boton añadir Funa
                Container(
                  alignment: Alignment.center,
                  width: ancho*0.15,
                  height: ancho*0.15,
                  margin: EdgeInsets.all(altura*0.06),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(230, 87, 56, 1), 
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(   // cambio de pagina
                        context,
                        MaterialPageRoute(builder: (context) => NuevaFuna()),
                      );
                   }, 
                    icon: Icon(Icons.add_rounded), 
                    iconSize: ancho*0.1,
                    color: Colors.white,
                  ),
                ),              ],
            )
          ],
        )
      )
    );
  }
}