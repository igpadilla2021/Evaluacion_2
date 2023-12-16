import 'package:denuncios/Pages/ingreso.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  @override
  Widget build(BuildContext context) {
    double ancho=MediaQuery.of(context).size.width.toDouble();
    double altura=MediaQuery.of(context).size.height.toDouble()- MediaQuery.of(context).padding.top- MediaQuery.of(context).padding.bottom;

    
    return WillPopScope(
      onWillPop:() async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(   
          backgroundColor: Color.fromRGBO(52, 83, 106, 1),      
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text("Bienvenido a", style: GoogleFonts.poppins(color: Color.fromRGBO(254, 228, 214, 1),fontSize: ancho*0.09 ),),
                Text("Denuncios", style: GoogleFonts.poppins(color: Color.fromRGBO(230, 87, 56, 1), fontSize: ancho*0.15, fontWeight: FontWeight.w500), ),

                SizedBox(height: altura*0.2),

                // Boton Login
                Container(
                  width: ancho*0.8,
                  height: altura*0.065,
                  child: FloatingActionButton(
                    heroTag: 'iniciar sesion',
                    backgroundColor: const Color.fromRGBO(41, 52, 65, 1),
                    elevation: 0,
                    onPressed: (){
                      Navigator.push(   // cambio de pagina
                        context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => Ingreso(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = 0.0;
                              const end = 50.0;
                              const curve = Curves.easeInOut;

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
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)) ),
                    child: const Text("Iniciar sesion", style: TextStyle(color: Colors.white),),
                  ),
                ),
                
                SizedBox(height: altura*0.03,),

                // Boton Register
                Container(
                  width: ancho*0.8,
                  height: altura*0.065,
                  child: FloatingActionButton(
                    heroTag: 'registrarse',
                    backgroundColor: const Color.fromRGBO(41, 52, 65, 1),
                    elevation: 0,
                    onPressed: (){},
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)) ),
                    child: const Text("Registrarse", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          )
        )
      )
    );
  }
}