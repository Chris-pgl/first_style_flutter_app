import 'package:flutter/material.dart';

class TextStyleWidgest extends StatelessWidget {
  const TextStyleWidgest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "1) Proprietà di stile di testo",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          "Color del testo",
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Text("Word spacing", style: TextStyle(wordSpacing: 4)),
      ],
    );
  }
}
