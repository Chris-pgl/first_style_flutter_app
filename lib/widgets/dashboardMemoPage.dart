import 'package:flutter/material.dart';

class Dashboardmemopage extends StatelessWidget {
  const Dashboardmemopage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Memorizzo la dimensione dello schermo
    final size = MediaQuery.of(context).size;

    //Integro Scaffold
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard Memo")),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: const Center(child: Text("Contenuto alla dashboard qui")),
      ),
    );
  }
}
