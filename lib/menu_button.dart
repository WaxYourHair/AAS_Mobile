import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title;
  final String? routeName;

  MenuButton({required this.title, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          if (routeName != null) {
            Navigator.pushNamed(context, routeName!);
          }
        },
        child: Center(
          child: Text(title),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          textStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
