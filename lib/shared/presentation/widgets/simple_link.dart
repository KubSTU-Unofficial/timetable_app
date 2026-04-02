import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SimpleLink extends StatelessWidget {
  final String text;
  final String url;

  const SimpleLink({
    super.key,
    required this.text,
    required this.url,
  });

  Future<void> _openLink() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openLink,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}