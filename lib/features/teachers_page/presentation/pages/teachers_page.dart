import 'package:flutter/material.dart';
// заглушка, макет будущей страницы не более

//context.colors
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
				child: Center(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text("Здесь будет расписание преподавателей")
						],
					),
				),
			),
		);
	}
}
