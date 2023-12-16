import 'package:denuncios/Pages/ingreso.dart';
import 'package:flutter/material.dart';
import 'package:denuncios/pages/inicio.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(52, 83, 106, 1),  // Color de la barra de estado
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white, // Hacer la barra de navegación transparente
        systemNavigationBarIconBrightness: Brightness.dark
      ),
    ); 
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Ingreso(),
    );
  }
}
