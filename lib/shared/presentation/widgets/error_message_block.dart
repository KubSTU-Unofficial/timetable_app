import 'package:flutter/material.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

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
								backgroundColor: context.colors.error,
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
								style: TextStyle(color: context.colors.textPrimary),
							),
						),
			  	],
			  ),
			),
		);
  }
  
}
