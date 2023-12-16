import 'package:denuncios/Pages/inicio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:denuncios/Pages/listado.dart';
import 'package:flutter/services.dart';

class Ingreso extends StatefulWidget {
  const Ingreso({super.key});

  @override
  State<Ingreso> createState() => _IngresoState();
}

class _IngresoState extends State<Ingreso> {
  final TextEditingController _username = TextEditingController();    // obtencion de texto de username  
  final TextEditingController _password= TextEditingController();     // obtencion de texto de password

  @override
  Widget build(BuildContext context) {
    double ancho=MediaQuery.of(context).size.width.toDouble();
    double altura=MediaQuery.of(context).size.height.toDouble()- MediaQuery.of(context).padding.bottom;
    double extra=MediaQuery.of(context).padding.top;

    return  WillPopScope(
      onWillPop:() 
      async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Saliendo de la app'),
            content: Text('¿Estás seguro de que quieres cerrar la aplicación?'),
            
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Cerrar'),
              ),
            ],
          ),
        );
      },
      child: SafeArea(
        top: false,
        child: Scaffold (
          backgroundColor: Colors.white,

          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: ancho, height: altura*0.1+extra,),

                // Text
                Row(
                  children: [
                    SizedBox(width: ancho*0.05,),
                    Text("Iniciar Sesion",style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(41, 52, 65, 1),
                      fontSize: altura*0.04, 
                      fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
                
                SizedBox(height: altura*0.05,),

                Row(
                  children: [
                    SizedBox(width: ancho*0.05,),
                    Text("EMAIL :",style: GoogleFonts.poppins(
                      color: Color.fromRGBO(41, 52, 65, 1),
                      fontSize: altura*0.021, 
                      fontWeight: FontWeight.w600)
                    ),
                  ],
                ),

                SizedBox(height: altura*0.01,),

                // Textfield Email
                Container(
                  alignment: Alignment.center,
                  width: ancho*0.9,
                  height: altura*0.07,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 239, 242, 1),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: TextField(
                    controller: _username,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,                            
                    decoration: InputDecoration(    
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText:"ignacio@gmail.com",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2, 
                          color: Colors.white,
                        )
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: altura*0.02,),

                Row(
                  children: [
                    SizedBox(width: ancho*0.05,),
                    Text("CONTRASEÑA :",style: GoogleFonts.poppins(
                      color: Color.fromRGBO(41, 52, 65, 1),
                      fontSize: altura*0.021, 
                      fontWeight: FontWeight.w600)
                    ),
                  ],
                ),

                SizedBox(height: altura*0.01,),

                // Textfield Password
                Container(
                  alignment: Alignment.center,
                  width: ancho*0.9,
                  height: altura*0.07,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(235, 239, 242, 1),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: TextField(
                    controller: _password,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,                            
                    decoration: const InputDecoration(    
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText:"********",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2, 
                          color: Colors.white,
                        )
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: altura*0.05,),

                // Boton Login
                Container(
                  width: ancho*0.9,
                  height: altura*0.065,
                  child: FloatingActionButton(
                    heroTag: 'Iniciar sesion',
                    backgroundColor: Color.fromRGBO(230, 87, 56, 1),
                    elevation: 0,
                    onPressed: (){
                      Navigator.push(   // cambio de pagina
                        context, 
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => Listado(),
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
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(23)) ),
                    child: const Text("Ingresar", style: TextStyle(color: Colors.white),),
                  ),
                ),

              ],
            ),
          ),
          bottomNavigationBar: Container(
                      width: ancho*0.8,
                      height: altura*0.05,
                      child: FloatingActionButton(
                        heroTag: 'registro',
                        backgroundColor: Colors.white,
                        elevation: 0,
                        onPressed: (){
                        },
                        child: const Text("No tienes una cuenta? Registrate ahora", style: TextStyle(color: Color.fromRGBO(41, 52, 65, 1)),),
                      ),
                    ),
        )
      )
    );
  }
}