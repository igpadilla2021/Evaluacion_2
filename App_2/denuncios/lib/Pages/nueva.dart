import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:denuncios/Pages/listado.dart';

class NuevaFuna extends StatefulWidget {
  const NuevaFuna({super.key});

  @override
  State<NuevaFuna> createState() => _NuevaFunaState();
}

class _NuevaFunaState extends State<NuevaFuna> {
  
  @override
  Widget build(BuildContext context) {
    double ancho=MediaQuery.of(context).size.width.toDouble();
    double altura=MediaQuery.of(context).size.height.toDouble()- MediaQuery.of(context).padding.top- MediaQuery.of(context).padding.bottom;

    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Listado(),
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
                      Text("Avisar nueva Denuncia",style: GoogleFonts.poppins(
                        color: Color.fromRGBO(254, 228, 214, 1),
                        fontSize: altura*0.03, 
                        fontWeight: FontWeight.w500)
                      ),
                    ],
                  )            ),

                SizedBox(height: altura*0.07,),

                //Campo Sector
                Container(
                  alignment: Alignment.topLeft,
                  width: ancho*0.9,
                  height: altura*0.065,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 239, 242, 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    maxLines: null, // Establecer en null para permitir un número ilimitado de líneas
                    keyboardType: TextInputType.multiline,                            
                    decoration: InputDecoration(    
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText:"Sector...",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2, 
                          color: Color.fromRGBO(235, 239, 242, 1),
                        )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: altura*0.02,),

                //campo Descripcion
                Container(
                  alignment: Alignment.topLeft,
                  width: ancho*0.9,
                  height: altura*0.2,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 239, 242, 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    maxLines: null, // Establecer en null para permitir un número ilimitado de líneas
                    keyboardType: TextInputType.multiline,                            
                    decoration: InputDecoration(    
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText:"Descripcion...",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2, 
                          color: Color.fromRGBO(235, 239, 242, 1),
                        )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: altura*0.02,),

                //Zona de imagenes
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Zona 1
                    Container(
                      height: altura*0.2,
                      width: ancho*0.4,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(235, 239, 242, 1),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Boton Camara
                          Container(
                            height: altura*0.14,
                            width: ancho*0.4,
                            alignment: Alignment.center,
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo_rounded),),
                          ),
                          // Boton Borrar
                          Container(
                            width: ancho*0.4,
                            height: altura*0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                              color: Color.fromRGBO(230, 87, 56, 1),
                            ),
                            child: FloatingActionButton(
                              backgroundColor: Color.fromRGBO(230, 87, 56, 1),
                              heroTag: "imagen_1",
                              onPressed: (){},
                              elevation: 0,
                              child: Icon(Icons.delete,color: Colors.white,),                          
                            ),
                          )
                        ],
                      ),
                    ),
                    
                    SizedBox(width: ancho*0.05,),
                    
                    //zona 2
                    Container(
                      height: altura*0.2,
                      width: ancho*0.4,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(235, 239, 242, 1),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Boton Camara
                          Container(
                            height: altura*0.14,
                            width: ancho*0.4,
                            alignment: Alignment.center,
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo_rounded),),
                          ),
                          // Boton Borrar
                          Container(
                            width: ancho*0.4,
                            height: altura*0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                              color: Color.fromRGBO(230, 87, 56, 1),
                            ),
                            child: FloatingActionButton(
                              backgroundColor: Color.fromRGBO(230, 87, 56, 1),
                              heroTag: "imagen_2",
                              onPressed: (){},
                              elevation: 0,
                              child: Icon(Icons.delete,color: Colors.white,),                          
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: altura*0.05,),

                // Boton Crear
                Container(
                  width: ancho*0.9,
                  height: altura*0.08,
                  child: FloatingActionButton(
                    heroTag: 'crear',
                    backgroundColor: Color.fromRGBO(41, 52, 65, 1),
                    elevation: 0,
                    onPressed: (){
                      Navigator.push(   // cambio de pagina
                        context,
                        MaterialPageRoute(builder: (context) => Listado()),
                      );
                    },
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(23)) ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_rounded, color: Colors.white,size: altura*0.05,),
                        Text("Realizar Denuncia", style: TextStyle(color: Colors.white),)
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
                        MaterialPageRoute(builder: (context) => Listado()),
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