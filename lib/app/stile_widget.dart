import 'package:flutter/material.dart';

class StileWidget extends StatelessWidget {
  const StileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Stili"),
        backgroundColor: Colors.amber,
      ),
      body: ListView(padding: const EdgeInsets.all(12), children: []),
    );
  }
}
