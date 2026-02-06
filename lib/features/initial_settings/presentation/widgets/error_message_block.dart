import 'package:flutter/material.dart';
import 'package:timetable_app/shared/presentation/error_message.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class ErrorMessageBlock extends StatelessWidget {
  const ErrorMessageBlock({
		super.key,
		required this.errorMessage,
		required this.circumstances,
		required this.onRetry,
	});

	final String errorMessage;
	final String circumstances;
	final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
		return Center(
			child: Padding(
			  padding: const EdgeInsets.all(16.0),
			  child: Column(
					spacing: 32,
			  	mainAxisAlignment: .center,
			  	children: [
			  		ErrorMessage(
			  			circumstances: circumstances,
			  			error: errorMessage,
			  		),
						TextButton(
							onPressed: onRetry,
							style: TextButton.styleFrom(
								backgroundColor: AppColors.error,
								padding: const EdgeInsets.symmetric(
									horizontal: 24,
									vertical: 12,
								),
								shape: RoundedRectangleBorder(
									borderRadius: BorderRadius.circular(8),
								),
							),
							child: Text(
								"Попробовать снова",
								style: TextStyle(color: AppColors.textPrimary),
							),
						),
			  	],
			  ),
			),
		);
  }
  
}
