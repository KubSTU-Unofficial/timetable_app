import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SimpleGitHubLink extends StatelessWidget {
  const SimpleGitHubLink({super.key});

  Future<void> _openGitHub() async {
    final Uri url = Uri.parse('https://github.com/KubSTU-Unofficial/timetable_app/tree/main?tab=readme-ov-file');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openGitHub,
      child: const Text(
        'GitHub',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}