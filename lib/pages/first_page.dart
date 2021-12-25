import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[600],
      body: const Center(
        child: Text(
          "Open First Page Sucsses",
          style: TextStyle(
            fontSize: 34.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
