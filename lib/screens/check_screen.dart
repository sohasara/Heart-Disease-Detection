import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Heart Health Check")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _section(
              title: "Personal Information",
              icon: Icons.person,
              children: [
                _field("Age (years)"),
                Row(
                  children: const [
                    Expanded(
                      child: RadioListTile(
                        value: 1,
                        groupValue: 1,
                        onChanged: null,
                        title: Text("Male"),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        value: 0,
                        groupValue: 1,
                        onChanged: null,
                        title: Text("Female"),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            _section(
              title: "Symptoms & History",
              icon: Icons.favorite,
              color: Colors.pinkAccent,
              children: [
                _field("Chest Pain Type"),
                SwitchListTile(
                  title: const Text("Exercise-Induced Angina"),
                  value: false,
                  onChanged: (_) {},
                ),
                _field("ST Depression (Oldpeak)"),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
              ),
              child: const Text("Analyze Heart Disease Risk"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section({
    required String title,
    required IconData icon,
    Color color = Colors.teal,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.15),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _field(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
