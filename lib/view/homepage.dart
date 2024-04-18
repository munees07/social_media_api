import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black12),
      child: const Center(
        child: Text(
          'HomeScreen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    ));
  }
}
