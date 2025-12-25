import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History Reports")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Stats
            Row(
              children: const [
                _StatCard(title: "Total Checks", value: "4"),
                SizedBox(width: 12),
                _StatCard(title: "Low Risk Results", value: "2"),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              "Assessment Timeline",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _HistoryItem(
              date: "December 25, 2024",
              time: "2:30 PM",
              risk: "Low Risk",
              percent: 15,
            ),
            _HistoryItem(
              date: "November 18, 2024",
              time: "10:15 AM",
              risk: "Low Risk",
              percent: 18,
            ),
            _HistoryItem(
              date: "October 5, 2024",
              time: "3:45 PM",
              risk: "Medium Risk",
              percent: 48,
            ),
            _HistoryItem(
              date: "September 12, 2024",
              time: "11:20 AM",
              risk: "Medium Risk",
              percent: 52,
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- WIDGETS --------------------

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00A896),
                ),
              ),
              const SizedBox(height: 6),
              Text(title, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final String date;
  final String time;
  final String risk;
  final int percent;

  const _HistoryItem({
    required this.date,
    required this.time,
    required this.risk,
    required this.percent,
  });

  Color get riskColor => risk == "Low Risk" ? Colors.green : Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: riskColor.withOpacity(0.15),
              child: Icon(Icons.favorite, color: riskColor),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          date,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: riskColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          risk,
                          style: TextStyle(fontSize: 12, color: riskColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: percent / 100,
                          backgroundColor: Colors.grey.shade300,
                          color: riskColor,
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "$percent%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: riskColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
