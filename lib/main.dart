import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(


      ),
      body: CounterWidget(),
    ),
  ));
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[

          Expanded(
            child: Text ('Quantité')),


Expanded(child: Row(
  
  mainAxisAlignment: MainAxisAlignment.center,
  children: [          OutlinedButton(
            onPressed: _decrement,
            child: Icon(Icons.add_alarm),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              side: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '$_counter',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          OutlinedButton(
            onPressed: _increment,
            child: Icon(Icons.add),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              side: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
              
            ),
          )
          ],))

        ],
      ),
    );
  }
}