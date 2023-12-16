import 'dart:convert';
import 'dart:io';

import 'package:denuncios/Pages/ingreso.dart';
import 'package:denuncios/Pages/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:denuncios/Objetos/denuncia.dart';
import 'package:denuncios/Pages/nueva.dart';

class Listado extends StatefulWidget {
  const Listado({super.key});
  
  @override
  State<Listado> createState() => _ListadoState();
}

class _ListadoState extends State<Listado> {
  
  @override
  Widget build(BuildContext context) {
    List<Widget> listaDeWidgets = [];
    double ancho=MediaQuery.of(context).size.width.toDouble();
    double altura=MediaQuery.of(context).size.height.toDouble()- MediaQuery.of(context).padding.top- MediaQuery.of(context).padding.bottom;

    for(int c=0; c<8; c=c+1){
      if(c==0){
      listaDeWidgets.add(SizedBox(height: altura*0.03,));
      listaDeWidgets.add(
        Container(alignment: Alignment.center, height: altura*0.295, width: ancho*0.9,child: Text("Imagen relacionada a la app"),
        decoration: BoxDecoration(
          color: Color.fromRGBO(132, 157, 177, 1),
          borderRadius: BorderRadius.circular(10),
        ),));
      }
      listaDeWidgets.add(SizedBox(height: altura*0.03,));
      listaDeWidgets.add(Funa(heroTag: c.toString()));
      if(c==7){
        listaDeWidgets.add(SizedBox(height: altura*0.03,));
      }
    };

    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Ingreso(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = 0.0;
              const end = 50.0;
              const curve = Curves.linear;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              var fadeAnimation = animation.drive(tween);

              return FadeTransition(
                opacity: fadeAnimation,
                child: child,
              );
            },
          )
        );
        return false;
      },
      child: SafeArea(
        child: Scaffold(
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
                      height: altura*0.13,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(52, 83, 106, 1), 
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                        ),
                      ),
                      child: Text("Lista de Denuncias",style: GoogleFonts.poppins(
                        color: Color.fromRGBO(254, 228, 214, 1), 
                        fontSize: altura*0.03, 
                        fontWeight: FontWeight.w500)
                      ),
                    ),
                    
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: altura*0.13,
                          child: IconButton(onPressed: (){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => Ingreso(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = 0.0;
                                  const end = 50.0;
                                  const curve = Curves.linear;

                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                  var fadeAnimation = animation.drive(tween);

                                  return FadeTransition(
                                    opacity: fadeAnimation,
                                    child: child,
                                  );
                                },
                              )
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
                      height: altura*0.87,
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
                        color: const Color.fromRGBO(41, 52, 65, 1),
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
        ),
      ),
    );
  }
}