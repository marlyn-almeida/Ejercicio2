import 'package:flutter/material.dart';
import 'widgets/distance_calculator.dart';  // Importamos la pantalla de calculadora de distancia directamente

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Distancia Euclidiana',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: DistanceCalculator(),  // Lanza la pantalla de calculadora directamente
    );
  }
}
