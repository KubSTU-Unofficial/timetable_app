import 'package:flutter/material.dart';
import 'package:timetable_app/features/exams_page/presentation/widgets/exams_page_bloc_widget.dart';

//widgets
import 'package:timetable_app/features/exams_page/presentation/widgets/exams_card_widget.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class ExamsPage extends StatelessWidget {
	const ExamsPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: context.colors.background,
			body: SafeArea(
				child: Center(
					child: ExamsPageBlocWidget(
						builder: (ctx, exams, onRefreshRequested) {
							// Если экзаменов нет
							if (exams == null || exams.isEmpty) {
								return RefreshIndicator(
									onRefresh: onRefreshRequested,
									child: LayoutBuilder(
										builder: (context, constraints) {
											return SingleChildScrollView(
												physics: AlwaysScrollableScrollPhysics(),
												child: ConstrainedBox(
												  constraints: constraints,
												  child: Column(
														spacing: 8.0,
												  	mainAxisAlignment: MainAxisAlignment.center,
												  	children: [
												  		Text(
												  			"Информации об экзаменах пока нет.",
												  			style: TextStyle(fontSize: 16),
												  		),
															TextButton(onPressed: onRefreshRequested, child: Text("Обновить")),
												  	],
												  ),
												),
											);
										}
									),
								);
							}
							return RefreshIndicator(
								onRefresh: onRefreshRequested,
								child: ListView.builder(
									itemCount: exams.length,
									itemBuilder: (context, index) {
										return ExamsCardWidget(exams: exams[index]); 
										//ExamsCardWidget(exams: exams[idx]);
									},
								),
							);
						},
					),
				),
			),
		);
	}
}
