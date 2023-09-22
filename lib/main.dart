import 'package:calculator/algorithm.dart';
import 'package:calculator/custom_number_button.dart';
import 'package:calculator/custom_symbol_buttom.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = 'Calculator';

    return const MaterialApp(
      title: title,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _value1 = '';

  String _value2 = '';

  void _addNumber(String append) {
    setState(() {
      _value2 += append;
    });
  }

  void _addOpp(String append) {
    setState(() {
      _operate();

      _value2 += append;
    });
  }

  void _clear(String kosong) {
    setState(() {
      _value2 = '';
      _value1 = '';
    });
  }

  void _plusMinus(String kosong) {
    setState(() {
      _operate();

      _value2 = (double.parse(_value2) * -1).toString();
      if (_value1.isNotEmpty) {
        _value1 = '-( $_value1 )';
      }
    });
  }

  void _persen(String kosong) {
    setState(() {
      _operate();
      _value2 = (double.parse(_value2) / 100).toString();
      if (_value1.isNotEmpty) {
        _value1 = '( $_value1 )%';
      }
    });
  }

  void _del(String kosong) {
    setState(() {
      if (_value2.isNotEmpty) {
        _value2 = _value2.substring(0, _value2.length - 1);
      }
    });
  }

  void _operate() {
    setState(() {
      final result = extractValuesAndOperator(_value2);

      if (result != null) {
        // Output the results.
        double n1 = result[0];
        double n2 = result[2];
        String op = result[1];
        switch (op) {
          case '+':
            _value1 = _value2;
            _value2 = (n1 + n2).toString();
            break;
          case '-':
            _value1 = _value2;
            _value2 = (n1 - n2).toString();
            break;
          case 'x':
            _value1 = _value2;
            _value2 = (n1 * n2).toString();
            break;
          case '/':
            _value1 = _value2;
            _value2 = (n1 / n2).toString();
            break;
          default:
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 212, 223, 236),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(bottom: 5, right: 20),
                      child: Text(
                        _value1,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 123, 122, 122)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(bottom: 25, right: 20),
                      child: Text(
                        _value2,
                        style: const TextStyle(fontSize: 48),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 29, 32, 39),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 56, 62, 79),
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SymbolButton(symbol: 'C', function: _clear),
                        SymbolButton(symbol: 'DEL', function: _del),
                        SymbolButton(symbol: '-/+', function: _plusMinus),
                        SymbolButton(symbol: 'x', function: _addOpp),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: GridView.count(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 3,
                            padding: const EdgeInsets.all(10),
                            children: [
                              NumberButton(number: '7', function: _addNumber),
                              NumberButton(number: '8', function: _addNumber),
                              NumberButton(number: '9', function: _addNumber),
                              NumberButton(number: '4', function: _addNumber),
                              NumberButton(number: '5', function: _addNumber),
                              NumberButton(number: '6', function: _addNumber),
                              NumberButton(number: '1', function: _addNumber),
                              NumberButton(number: '2', function: _addNumber),
                              NumberButton(number: '3', function: _addNumber),
                              NumberButton(number: '%', function: _persen),
                              NumberButton(number: '0', function: _addNumber),
                              NumberButton(number: '.', function: _addNumber),
                            ],
                          ),
                        ),
                        Container(
                          color: const Color.fromARGB(255, 56, 62, 79),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: SymbolButton(
                                      symbol: '/', function: _addOpp)),
                              Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: SymbolButton(
                                      symbol: '-', function: _addOpp)),
                              Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: SymbolButton(
                                      symbol: '+', function: _addOpp)),
                              Container(
                                padding:
                                    const EdgeInsets.only(bottom: 50, top: 50),
                                color: const Color.fromARGB(255, 31, 206, 237),
                                child: TextButton(
                                  onPressed: () {
                                    _operate();
                                  },
                                  child: const Text(
                                    "=",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 56, 62, 79),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
