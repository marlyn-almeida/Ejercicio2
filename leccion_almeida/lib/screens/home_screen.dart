import 'package:flutter/material.dart';
import 'package:leccion_almeida/widgets/distance_calculator.dart';  // Cambié el nombre del archivo aquí

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: const EdgeInsets.symmetric(vertical: 15),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            // Navegar a la pantalla de calculadora de distancia
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DistanceCalculator()),
            );
          },
          child: Text('Ir a la Calculadora'),
        ),
      ),
    );
  }
}
