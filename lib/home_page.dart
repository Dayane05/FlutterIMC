import 'package:flutter/material.dart';

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = '';

  get titleTextStyle => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Peso (kg)', hintText: 'Ex: 70'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Altura (cm)', hintText: 'Ex: 170'),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 'Masculino',
                groupValue: result,
                onChanged: (value) {
                  setState(() {
                    result = value.toString();
                  });
                },
              ),
              Text('Masculino',  style: TextStyle(fontWeight: FontWeight.bold)),
              Radio(
                value: 'Feminino',
                groupValue: result,
                onChanged: (value) {
                  setState(() {
                    result = value.toString();
                  });
                },
              ),
              Text('Feminino',  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: calculateBMI,
            child: Text('Calcular'),
            style: ElevatedButton.styleFrom(
              elevation: 20,
              padding: const EdgeInsets.all(20),
              primary:   Color.fromARGB(255, 3, 12, 63),
  ),
          ),
          SizedBox(height: 16),
          Text('Resultado: $result'),
        ],
      ),
    );
  }

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double bmi = weight / ((height / 100) * (height / 100));

      setState(() {
        result = 'IMC: ${bmi.toStringAsFixed(2)} - ${interpretBMI(bmi)}';
      });
    } else {
      setState(() {
        result = 'Por favor, insira valores válidos para peso e altura, sem pontos ou vírgulas.';
      });
    }
  }

  String interpretBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Abaixo do Peso';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Peso Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Acima do Peso';
    } else {
      return 'Obesidade';
    }
  }
}

