import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _outputHistory = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  bool _reset = false;

  void buttonPressed(String buttonText) {
    if (_reset) {
      _output = '0';
      _reset = false;
    }
    if (buttonText == 'C') {
      _output = '0';
      _outputHistory = '';
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = '0';
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      if (_operand == '+') {
        _output = (_num1 + _num2).toString();
      }
      if (_operand == '-') {
        _output = (_num1 - _num2).toString();
      }
      if (_operand == 'x') {
        _output = (_num1 * _num2).toString();
      }
      if (_operand == '/') {
        _output = (_num1 / _num2).toString();
      }
      _operand = '';
      _reset = true;
    } else {
      if (_output == '0') {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    setState(() {
      if (_operand.isNotEmpty) {
        _outputHistory = '$_num1 $_operand';
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _outputHistory,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    _output,
                    style: TextStyle(fontSize: 48),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton('C', 1, Colors.grey),
                        buildButton('+/-', 1, Colors.grey),
                        buildButton('%', 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('7', 1, Colors.black54),
                        buildButton('8', 1, Colors.black54),
                        buildButton('9', 1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('4', 1, Colors.black54),
                        buildButton('5', 1, Colors.black54),
                        buildButton('6', 1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('1', 1, Colors.black54),
                        buildButton('2', 1, Colors.black54),
                        buildButton('3', 1, Colors.black54),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('.', 1, Colors.black54),
                        buildButton('0', 1, Colors.black54),
                        buildButton('00', 1, Colors.black54),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton('/', 1, Colors.orange),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('x', 1, Colors.orange),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('-', 1, Colors.orange),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('+', 1, Colors.orange),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('=', 2, Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
