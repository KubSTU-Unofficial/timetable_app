import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:timetable_app/shared/presentation/bloc/timetable_loading/timetable_loading_bloc.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class TimetableUpdateToastListener extends StatelessWidget {

	final Widget child;

	const TimetableUpdateToastListener({super.key, required this.child});

	@override
	Widget build(BuildContext context) {
		return BlocListener<TimetableLoadingBloc, TimetableLoadingBlocState>(
			listener: (context, state) {
				if (state is TimetableLoadingErrorState) {
					FToast().init(context).showToast(
						toastDuration: Duration(seconds: 8),
						gravity: ToastGravity.BOTTOM,
						child: Padding(
						  padding: const EdgeInsets.only(bottom: 32),
						  child: Container(
						  	padding: const EdgeInsets.all(12),
						  	decoration: BoxDecoration(
						  		color: Colors.red,
						  		borderRadius: BorderRadius.circular(8),
						  	),
						  	child: ErrorMessage(
									circumstances: "загрузке пар",
									error: state.error,
									direction: ErrorMessage.up,
									textColor: context.colors.textInverse,
									offset: 32,
								),
						  ),
						),
					);
				} else if (state is TimetableLoadingReadyState && state.causedByRefresh) {
					FToast().init(context).showToast(
						toastDuration: Duration(seconds: 4),
						gravity: ToastGravity.BOTTOM,
						child: Padding(
						  padding: const EdgeInsets.only(bottom: 32),
						  child: Container(
						  	padding: const EdgeInsets.all(12),
						  	decoration: BoxDecoration(
						  		color: Colors.green,
						  		borderRadius: BorderRadius.circular(8),
						  	),
						  	child: Text("Данные обновлены в ${DateFormat('dd-MM-yyyy, HH:mm').format(state.updatedAt)}", style: TextStyle(color: Colors.white),),
						  ),
						),
					);
				}
			},
			child: child,
		);
	}
}
