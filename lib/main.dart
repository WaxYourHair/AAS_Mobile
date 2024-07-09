import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'calculator_screen.dart';
import 'zikir_screen.dart';
import 'tictactoe.dart';
import 'todolist.dart';
import 'web_view_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: MainScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/calculator': (context) => CalculatorScreen(),
        '/zikir': (context) => ZikirScreen(),
        '/tictactoe': (context) => TicTacToeScreen(),
        '/todolist': (context) => TodoListScreen(),
        '/webview': (context) => WebScreenView(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Mobile'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text('Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/calculator');
              },
            ),
            ListTile(
              title: Text('Zikir'),
              onTap: () {
                Navigator.pushNamed(context, '/zikir');
              },
            ),
            ListTile(
              title: Text('TicTacToe'),
              onTap: () {
                Navigator.pushNamed(context, '/tictactoe');
              },
            ),
            ListTile(
              title: Text('Todo List'),
              onTap: () {
                Navigator.pushNamed(context, '/todolist');
              },
            ),
            ListTile(
              title: Text('WebView'),
              onTap: () {
                Navigator.pushNamed(context, '/webview');
              },
            ),
          ],
        ),
      ),
      body: LoginScreen(),
    );
  }
}
