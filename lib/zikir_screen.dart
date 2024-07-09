import 'package:flutter/material.dart';

class ZikirScreen extends StatefulWidget {
  @override
  _ZikirScreenState createState() => _ZikirScreenState();
}

class _ZikirScreenState extends State<ZikirScreen> {
  int _zikirCount = 0;

  void _incrementCounter() {
    setState(() {
      _zikirCount++;
    });
  }

  void _resetCounter() {
    setState(() {
      _zikirCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zikir Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Zikir Count:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_zikirCount',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Count'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text('Reset'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
