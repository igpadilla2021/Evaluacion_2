import 'package:denuncios/Pages/comentario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:denuncios/Pages/listado.dart';

class Detalles extends StatefulWidget {
  const Detalles({super.key});

  @override
  State<Detalles> createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {

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
          body: Column(
            children: [
             
              // FIGURA Superior 
              Container(
                alignment: Alignment.center,
                width: ancho,
                height: altura*0.16,  // 0.16
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(52, 83, 106, 1), 
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    // boton retroceso
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: ancho*0.1,
                          height: ancho*0.2,
                          child: IconButton(onPressed: (){
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
                          }, icon: Icon(Icons.arrow_back_ios_new_rounded, color: Color.fromRGBO(254, 228, 214, 1), size: ancho*0.08,)),
                        )
                      ],
                    ),

                    //Titulo y informacion del denunciante
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Container con informacion del denunciante
                        Container(
                          height: altura*0.12,
                          width: ancho*0.7,
                          margin: EdgeInsets.only(top: altura*0.02, bottom: altura*0.02),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 239, 242, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: ancho*0.03,),

                              // icono usuario
                              Icon(Icons.account_circle_rounded,size: ancho*0.13,),

                              SizedBox(width: ancho*0.03,),

                              // Informacion del denunciante
                              Container(
                                alignment: Alignment.centerLeft,
                                height:altura*0.08,
                                width: ancho*0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    
                                    // Usuario del creador
                                    Row(
                                      children: [
                                        Text(
                                          "Por:",style: GoogleFonts.poppins(
                                            color: const Color.fromRGBO(41, 52, 65, 1),
                                            fontSize: altura*0.018,
                                            fontWeight: FontWeight.w600                
                                          )
                                        ),
                                      ],
                                    ),

                                    // Fecha de denuncia
                                    Row(
                                      children: [
                                        Text(
                                          "Fecha:",style: GoogleFonts.poppins(
                                            color: const Color.fromRGBO(41, 52, 65, 1),
                                            fontSize: altura*0.017,
                                            fontWeight: FontWeight.w400                
                                          )
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
                        
              Container(
                height: altura*0.84,
                width: ancho,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: altura*0.04,),

                      // Sector
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: ancho*0.05,),
                          Container(
                            child: Text("Sector de Funa",style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(41, 52, 65, 1),
                                fontSize: altura*0.02,
                                fontWeight: FontWeight.w600                
                              )
                            ),
                          )
                        ],
                      ),
                    
                      SizedBox(height: altura*0.02,),
                      
                      // Descripcion
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: ancho*0.05,),
                          Container(
                            width: ancho*0.9,
                            child: Text(
                              "En tres tristes trastos de trigo, tres tristes tigres tragan trigo. Tragan trigo en un trigal, en tres tristes trastos de trigo, En tres tristes trastos de trigo, tres tristes tigres tragan trigo. Tragan trigo en un trigal, en tres tristes trastos de trigo",
                              maxLines: null,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(41, 52, 65, 1),
                                fontSize: altura*0.02,
                                fontWeight: FontWeight.w400 
                              )
                            ),
                          )
                        ],
                      ),
                    
                      // Row Imagenes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: altura*0.13,
                            width: ancho*0.4,
                            margin: EdgeInsets.only(top: ancho*0.05, bottom: ancho*0.05),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(219, 231, 240, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            height: altura*0.13,
                            width: ancho*0.4,
                            margin: EdgeInsets.only(top: ancho*0.05, bottom: ancho*0.05),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(219, 231, 240, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    
                      // Fue retirado?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // Boton Like
                          Container(
                            height: altura*0.07,
                            width: ancho*0.22,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(254, 228, 214, 1),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                              border: Border.all(color: Color.fromRGBO(230, 87, 56, 1), width: ancho*0.005)
                            ),                      
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.thumb_up_alt_rounded, size: altura*0.03,),
                                  color: Color.fromRGBO(230, 87, 56, 1),
                                ),
                                Container(
                                  width: altura*0.03,
                                  child: Text(
                                    "1",
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromRGBO(41, 52, 65, 1),
                                      fontSize: altura*0.025,
                                      fontWeight: FontWeight.w600
                                      
                                    )
                                  ),
                                ),
                              ],
                            )
                          ),

                          // Texto
                          Container(
                            alignment: Alignment.center,
                            height: altura*0.07,
                            width: ancho*0.4,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(230, 87, 56, 1),
                            ),
                            child: Text(
                              "¿Fue solucionado?",
                              maxLines: null,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: altura*0.02,
                                fontWeight: FontWeight.w400 
                              )
                            ),
                          ),

                          // Boton dislike
                          Container(
                            height: altura*0.07,
                            width: ancho*0.22,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(254, 228, 214, 1),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
                              border: Border.all(color: Color.fromRGBO(230, 87, 56, 1), width: ancho*0.005)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: altura*0.03,
                                  child: Text(
                                    "7",
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromRGBO(41, 52, 65, 1),
                                      fontSize: altura*0.025,
                                      fontWeight: FontWeight.w600
                                    )
                                  ),
                                ),
                                IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.thumb_down_alt_rounded, size: altura*0.03,),
                                  color: Color.fromRGBO(230, 87, 56, 1),
                                ),
                              ],
                            )
                          ),
                        ],
                      ),

                      // Comentarios
                      Container(
                        margin: EdgeInsets.all(ancho*0.05),
                        width: ancho*0.9,
                        height: altura*0.28,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(219, 231, 240, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: altura*0.02,),

                            // Container con cantidad de comentarios
                            Container(
                              height: altura*0.03,
                              width: ancho*0.9,
                              child: Row(
                                children: [
                                  SizedBox(width: altura*0.02,),
                                  Text(
                                    "Comentarios",style: GoogleFonts.poppins(
                                      color: const Color.fromRGBO(41, 52, 65, 1),
                                      fontSize: altura*0.018,
                                      fontWeight: FontWeight.w600
                                    )
                                  ),
                                  SizedBox(width: ancho*0.02,),
                                  Text(
                                    "0",style: GoogleFonts.poppins(
                                      color: Color.fromARGB(255, 133, 146, 162),
                                      fontSize: altura*0.018,
                                      fontWeight: FontWeight.w500                
                                    )
                                  ),
                                  Expanded(child: Container()),
                                  IconButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation, secondaryAnimation) => Comentario(),
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
                                    }, 
                                    icon: Icon(Icons.add_comment_rounded), 
                                    iconSize: altura*0.03, 
                                    padding: EdgeInsets.all(0),
                                  ),
                                  SizedBox(width: altura*0.02,),
                                ],
                              ),
                            ),
                            
                            SizedBox(height: altura*0.02,),

                            Container(
                              width: ancho*0.9,
                              height: altura*0.19,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(width: ancho*0.8,height: altura*0.08,color: Color.fromRGBO(180, 191, 201, 1)),
                                    SizedBox(height: altura*0.02,),
                                    Container(width: ancho*0.8,height: altura*0.08,color: Color.fromRGBO(180, 191, 201, 1)),
                                    SizedBox(height: altura*0.02,),
                                    Container(width: ancho*0.8,height: altura*0.08,color: Color.fromRGBO(180, 191, 201, 1)),
                                  
                                  ],
                                ),
                              )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}