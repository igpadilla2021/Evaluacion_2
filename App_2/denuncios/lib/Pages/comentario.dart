import 'package:denuncios/Pages/detalles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:denuncios/Pages/listado.dart';

class Comentario extends StatefulWidget {
  const Comentario({super.key});

  @override
  State<Comentario> createState() => _ComentarioState();
}

class _ComentarioState extends State<Comentario> {
  
  @override
  Widget build(BuildContext context) {
    double ancho=MediaQuery.of(context).size.width.toDouble();
    double altura=MediaQuery.of(context).size.height.toDouble()- MediaQuery.of(context).padding.top- MediaQuery.of(context).padding.bottom;

    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Detalles(),
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Barra superior
                Container(
                  alignment: Alignment.center,
                  width: ancho,
                  height: altura*0.16,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(52, 83, 106, 1), 
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: ancho*0.05,),
                      Text("Sector de denuncia",style: GoogleFonts.poppins(
                        color: Color.fromRGBO(254, 228, 214, 1),
                        fontSize: altura*0.03, 
                        fontWeight: FontWeight.w500)
                      ),
                    ],
                  )
                ),

                SizedBox(height: altura*0.02,),

                //campo Comentario
                Container(
                  alignment: Alignment.topLeft,
                  width: ancho*0.9,
                  height: altura*0.5,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 239, 242, 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    maxLines: null, // Establecer en null para permitir un número ilimitado de líneas
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText:"Comentario...",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2, 
                          color: Color.fromRGBO(235, 239, 242, 1),
                        )
                      ),
                    ),
                  ),
                ),
           
                SizedBox(height: altura*0.05,),

                // Boton Crear
                Container(
                  width: ancho*0.9,
                  height: altura*0.08,
                  child: FloatingActionButton(
                    heroTag: 'comentar',
                    backgroundColor: Color.fromRGBO(41, 52, 65, 1),
                    elevation: 0,
                    onPressed: (){
                      Navigator.push(   // cambio de pagina
                        context,
                        MaterialPageRoute(builder: (context) => Detalles()),
                      );
                    },
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(23)) ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text("Realizar Comentario", style: TextStyle(color: Colors.white),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.send_rounded, color: Colors.white,size: altura*0.05,),
                            SizedBox(width: ancho*0.04,)
                          ],
                        )
                      ],
                    )
                  ),
                ),
                
                SizedBox(height: altura*0.04,),
                
                // Boton Volver
                Container(
                  width: ancho*0.9,
                  height: altura*0.065,
                  child: FloatingActionButton(
                    heroTag: 'volver',
                    backgroundColor: Color.fromRGBO(199, 208, 214, 1),
                    elevation: 0,
                    onPressed: (){
                      Navigator.push(   // cambio de pagina
                        context,
                        MaterialPageRoute(builder: (context) =>  Detalles()),
                      );
                    },
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(23)) ),
                    child: const Text("Regresar", style: TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}