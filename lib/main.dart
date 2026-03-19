import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  bool showMessage = false;

  String text = "Switch OFF";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Progetto Flutter1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 📷 Immagine
            Image.network(
              "https://www.darkhorsedirect.com/cdn/shop/files/CP2077_PRINT_NIGHT_CITY_DHD_PHOTO_DSP_KNGDM_4.png?v=1692033824&width=480",
              height: 150,
            ),

            const SizedBox(height: 20),

            // 🔘 Switch
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  text = isSwitched ? "Switch ON" : "Switch OFF";
                });
              },
            ),

            // 📝 Testo
            Text(text, style: const TextStyle(fontSize: 20)),

            const SizedBox(height: 20),

            // 🔘 Bottone 1 (mostra messaggio)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showMessage = true;
                });
              },
              child: const Text("Mostra messaggio"),
            ),

            // 🔘 Bottone 2 (nasconde messaggio)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showMessage = false;
                });
              },
              child: const Text("Nascondi messaggio"),
            ),

            const SizedBox(height: 20),

            // 💬 Messaggio
            if (showMessage)
              const Text(
                "Questo è il messaggio!",
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}
