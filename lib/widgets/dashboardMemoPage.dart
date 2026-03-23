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

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            _buildStatsRow(),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: size.width > 600 ? 2 : 1,
                crossAxisSpacing: size.width > 600 ? 20 : 8,
                mainAxisSpacing: size.width > 600 ? 20 : 8,
                children: [_buildTableArea(), _buildSidePanel()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _statCard(String label, String value, Color bgColor) {
  return Container(
    width: 110,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

//buildStatsRow, sarà la build della tabella
Widget _buildStatsRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _statCard("Totali", "24", Colors.blue.shade100),
      _statCard("Completati", "12", Colors.green.shade100),
      _statCard("Urgenti", "3", Colors.red.shade100),
    ],
  );
}

TableRow _tableHeader() {
  return const TableRow(
    decoration: BoxDecoration(color: Colors.black12),
    children: [
      Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Text("Titolo", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Text("Data", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Text("Priorità", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

TableRow _tableRow(String title, String date, String priority, bool completed) {
  return TableRow(
    decoration: BoxDecoration(color: _rowColor(priority, completed)),
    children: [
      Padding(padding: const EdgeInsets.all(8), child: Text(title)),
      Padding(padding: const EdgeInsets.all(8), child: Text(date)),
      Padding(padding: const EdgeInsets.all(8), child: Text(priority)),
    ],
  );
}

Widget _buildTableArea() {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FixedColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        _tableHeader(),
        _tableRow("Preparare presentazione", "Oggi", "Urgente", false),
        _tableRow("Spesa settimanale", "Domani", "Normale", false),
        _tableRow("Chiamare Marco", "Oggi", "Normale", true),
      ],
    ),
  );
}

Widget _buildSidePanel() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.yellow.shade100,
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Note rapide",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text("- Ricordarsi di inviaire email a Giulia "),
        SizedBox(height: 8),
        Text("- Aggiornare la lista dei progetti "),
        SizedBox(height: 8),
        Text("- Preparare i materiali per la riunione "),
      ],
    ),
  );
}

Color _rowColor(String priority, bool completed) {
  if (completed) return Colors.green.shade100;
  if (priority.toLowerCase() == "urgente")
    return const Color.fromARGB(255, 226, 156, 167);
  return Colors.white;
}
