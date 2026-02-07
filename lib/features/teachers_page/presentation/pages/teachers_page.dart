import 'package:flutter/material.dart';
// заглушка, макет будущей страницы не более
class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Расписание преподавателей')),
    );
  }
}
