import 'package:flutter/material.dart';
import 'dart:math';

class DistanceCalculator extends StatefulWidget {
  @override
  _DistanceCalculatorState createState() => _DistanceCalculatorState();
}

class _DistanceCalculatorState extends State<DistanceCalculator> {
  final TextEditingController x1Controller = TextEditingController();
  final TextEditingController y1Controller = TextEditingController();
  final TextEditingController x2Controller = TextEditingController();
  final TextEditingController y2Controller = TextEditingController();

  String result = '';  // Resultado de la distancia calculada
  String formula = ''; // Fórmula para mostrar en la interfaz

  // Función para calcular la distancia euclidiana
  double calculateEuclideanDistance(
      double x1, double y1, double x2, double y2) {
    return sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2));
  }

  // Función que ejecuta el cálculo
  void calculateDistance() {
    try {
      double x1 = double.parse(x1Controller.text);
      double y1 = double.parse(y1Controller.text);
      double x2 = double.parse(x2Controller.text);
      double y2 = double.parse(y2Controller.text);

      double distance = calculateEuclideanDistance(x1, y1, x2, y2);

      setState(() {
        result = 'La distancia euclidiana es: ${distance.toStringAsFixed(2)}';
        // Mostrar la fórmula en la respuesta
        formula = 'Fórmula: sqrt((${x2 - x1})² + (${y2 - y1})²)';
      });
    } catch (e) {
      setState(() {
        result = 'Por favor, ingresa valores numéricos válidos.';
        formula = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Distancia Euclidiana'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Color(0xFF00BFAE),  // Fondo azul turquesa
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Introduce las coordenadas:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _buildInputField('x1', x1Controller),
              SizedBox(height: 10),
              _buildInputField('y1', y1Controller),
              SizedBox(height: 10),
              _buildInputField('x2', x2Controller),
              SizedBox(height: 10),
              _buildInputField('y2', y2Controller),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: calculateDistance,
                child: Text('Calcular Distancia'),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (formula.isNotEmpty) ...[
                SizedBox(height: 10),
                Center(
                  child: Text(
                    formula,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir los campos de texto
  Widget _buildInputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
