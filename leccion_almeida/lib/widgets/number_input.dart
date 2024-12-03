import 'package:flutter/material.dart';

class NumberInput extends StatefulWidget {
  final void Function(int) onNumberChanged;

  const NumberInput({Key? key, required this.onNumberChanged}) : super(key: key);

  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  final TextEditingController _controller = TextEditingController();

  void _submitNumber() {
    final String text = _controller.text;
    final int? number = int.tryParse(text);
    if (number != null) {
      widget.onNumberChanged(number);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Ingresa un número:',
            border: OutlineInputBorder(),
            fillColor: Colors.purple[50],
            filled: true,
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _submitNumber,
          child: Text('Mostrar siguiente número'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple, //
          ),
        ),
      ],
    );
  }
}
