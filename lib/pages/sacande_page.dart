import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[600],
      body: const Center(
        child: Text(
          "Open Second Page Sucsses",
          style: TextStyle(
            fontSize: 34.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
