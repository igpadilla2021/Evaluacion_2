import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea_2/Pages/listado.dart';
import 'package:flutter/services.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final TextEditingController _username = TextEditingController();    // obtencion de texto de username  
  final TextEditingController _password= TextEditingController();     // obtencion de texto de password

  @override
  Widget build(BuildContext context) {
    double ancho=MediaQuery.of(context).size.width.toDouble();        // Ancho de la pantalla
    double altura=MediaQuery.of(context).size.height.toDouble();      // Largo de la pantalla
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Stack(
          alignment: Alignment.topCenter,
          children: [

            // FIGURA Superior 
            Container(
              alignment: Alignment.centerLeft,
              width: ancho,
              height: altura*0.22,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(52, 83, 106, 1), 
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: ancho*0.05,),
                  Text("Bienvenido a Funas!",style: GoogleFonts.poppins(
                    color: Color.fromRGBO(254, 228, 214, 1), 
                    fontSize: altura*0.03, 
                    fontWeight: FontWeight.w500)
                  ),
                ],
              )
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: altura*0.18,),

                // Sign in / Register
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: ancho*0.9,
                      height: altura*0.07,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(235, 239, 242, 1), 
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),                      
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Figura Sign In
                        Container(
                          alignment: Alignment.center,
                          width: ancho*0.45,
                          height: altura*0.07,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(230, 87, 56, 1), 
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Text("Ingreso", style: TextStyle(color: Colors.white),),
                        ),
                        // Figura Register
                        Container(
                          alignment: Alignment.center,
                          width: ancho*0.45,
                          height: altura*0.07,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 239, 242,1), 
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Text("Registro", style: TextStyle(color: Color.fromRGBO(41, 52, 65, 1)),),
                        ),
                      ],
                    )
                  ],
                ),

                SizedBox(height: altura*0.06,),

                // Textfield Email
                Container(
                  alignment: Alignment.center,
                  width: ancho*0.9,
                  height: altura*0.065,
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
                      hintText:"Email",
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

                // Textfield Password
                Container(
                  alignment: Alignment.center,
                  width: ancho*0.9,
                  height: altura*0.065,
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
                      hintText:"Contraseña",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2, 
                          color: Colors.white,
                        )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: altura*0.1,),

                // Boton Login
                Container(
                  width: ancho*0.9,
                  height: altura*0.065,
                  child: FloatingActionButton(
                    heroTag: 'iniciar sesion',
                    backgroundColor: const Color.fromRGBO(41, 52, 65, 1),
                    elevation: 0,
                    onPressed: (){
                      Navigator.push(   // cambio de pagina
                        context,
                        MaterialPageRoute(builder: (context) => Listado()),
                      );
                    },
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(23)) ),
                    child: const Text("iniciar sesion", style: TextStyle(color: Colors.white),),
                  ),
                ),

                SizedBox(height: altura*0.3,),

                //CREAR NUEVO USUARIO
                Container(
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
              ],
            )
          ],
        )
      )
    );
  }
}