import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timetable_app/features/exams_page/domain/entities/exam.dart';
import 'package:timetable_app/features/exams_page/presentation/bloc/local_bloc/exams_page_bloc.dart';
import 'package:timetable_app/features/exams_page/presentation/bloc/remote_bloc/exams_loading_bloc.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message_block.dart';
import 'package:timetable_app/shared/presentation/widgets/loading_indicator_block.dart';

class ExamsPageBlocWidget extends StatefulWidget {
	const ExamsPageBlocWidget({
		super.key,
		required this.builder,
	});

	final Widget Function(
		BuildContext context,
		List<Exam>? exams,
		Future<void> Function() onRefreshRequested
	) builder;

  @override
  State<ExamsPageBlocWidget> createState() => _ExamsPageBlocWidgetState();
}

class _ExamsPageBlocWidgetState extends State<ExamsPageBlocWidget> {

	Future<void> _onRefreshRequested(BuildContext context) async {
		context.read<ExamsLoadingBloc>().add(ExamsLoadingUpdateEvent());
		await _refreshCompleter.future;
	}

	final Completer<void> _refreshCompleter = Completer<void>();

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<ExamsLoadingBloc, ExamsLoadingBlocState>(
			builder: (BuildContext context, ExamsLoadingBlocState loadingState) {
				if (loadingState is! ExamsInitialLoadingInProcessState &&
					loadingState is! ExamsLoadingInProcessState &&
					!_refreshCompleter.isCompleted
				) {
					_refreshCompleter.complete();
				}
				if (loadingState is ExamsInitialLoadingInProcessState) { return LoadingIndicatorBlock(); }
				return Column(
					children: [
						if (loadingState is ExamsLoadingErrorState)
						ErrorMessage(circumstances: "загрузке списка экзаменов", error: loadingState.error, direction: ErrorMessage.down,),
						if (loadingState is ExamsLoadingInProcessState)
							Padding(
								padding: const EdgeInsets.symmetric(vertical: 16.0),
								child: Row(
								mainAxisAlignment: .center,
								children: [
									Text("Данные обновляются...", style: TextStyle(color: context.colors.textAccent),),
								],
							),
						),
						if (loadingState is ExamsLoadingReadyState)
						Padding(
							padding: const EdgeInsets.symmetric(vertical: 16.0),
							child: Text("Данные обновлены в ${DateFormat('dd-MM-yyyy, HH:mm').format(loadingState.updatedAt)}", style: TextStyle(color: context.colors.textAccent),),
						),
						Expanded(
							child: BlocBuilder<ExamsPageBloc, ExamsPageBlocState>(
								builder: (BuildContext context, ExamsPageBlocState state) {
									return switch (state) {
										ExamsPageInitialState() => SizedBox.shrink(),
										ExamsPageErrorState(error: final error) =>
										ErrorMessageBlock(
											errorMessage: error,
											circumstances: "загрузке экзаменов из базы данных",
											onRetry: () {
												context.read<ExamsPageBloc>().add(
													ExamsPageLessonsRequested(),
												);
											},
										),
										ExamsPageLoadedState(examsStrean: final examsStream) =>
										StreamBuilder(
											stream: examsStream,
											builder: (context, asyncSnapshot) {
												context.read<ExamsLoadingBloc>().state;
												return widget.builder(
													context,
													asyncSnapshot.data,
													() => _onRefreshRequested(context),
												);
											},
										),
									};
								},
							),
						),
					],
				);
			},
		);
	}
}

