import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'menu_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _showFeatures = false;

  void _toggleFeatures() {
    setState(() {
      _showFeatures = !_showFeatures;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!_showFeatures)
                Column(
                  children: [
                    const Text(
                      'Selamat Datang di Program Saya',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleFeatures,
                      child: const Text('Lihat Fitur'),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      shrinkWrap: true,
                      children: <Widget>[
                        MenuButton(title: 'Calculator', routeName: '/calculator'),
                        MenuButton(title: 'Zikir', routeName: '/zikir'),
                        MenuButton(title: 'TicTacToe', routeName: '/tictactoe'),
                        MenuButton(title: 'Todo-List', routeName: '/todolist'),
                        MenuButton(title: 'WebView', routeName: '/webview')
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>  LoginScreen()),
                          );
                        },
                        child: const Text('Logout'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _toggleFeatures,
                      child: const Text('Kembali'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
