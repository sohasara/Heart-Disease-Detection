import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 40),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF00A896),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: const Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Manage your account",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Personal Info
                  Card(
                    child: Column(
                      children: const [
                        _InfoTile(
                          icon: Icons.person,
                          title: "Name",
                          value: "John Doe",
                        ),
                        Divider(height: 1),
                        _InfoTile(
                          icon: Icons.email,
                          title: "Email",
                          value: "john.doe@example.com",
                        ),
                        Divider(height: 1),
                        _InfoTile(
                          icon: Icons.phone,
                          title: "Phone",
                          value: "+1 (555) 123-4567",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // About
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Color(0xFF00A896),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "About CardioCare AI",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            "CardioCare AI is an educational tool designed to help "
                            "you understand potential heart disease risk factors "
                            "based on common medical indicators.\n\n"
                            "Our AI model is trained on clinical datasets and "
                            "provides risk assessments to promote heart health "
                            "awareness. However, it is not a replacement for "
                            "professional medical diagnosis.",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  const Text(
                    "Version 1.0.0",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF00A896)),
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
