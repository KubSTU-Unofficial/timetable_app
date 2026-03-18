import 'package:flutter/material.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class LoadingIndicatorBlock extends StatelessWidget {
	const LoadingIndicatorBlock({super.key});

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Column(
				spacing: 32,
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Padding(
						padding: EdgeInsets.all(16.0),
						child: Text(
							textAlign: TextAlign.center,
							"Пожалуйста, подождите, данные скоро загрузятся..",
							style: TextStyle(
								color: context.colors.accent,
								fontSize: 14,
								fontWeight: FontWeight.bold,
							),
						),
					),
					CircularProgressIndicator(),
				],
			),);
	}

}
