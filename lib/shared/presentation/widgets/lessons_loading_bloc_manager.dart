import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/shared/presentation/bloc/timetable_loading/timetable_loading_bloc.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message_block.dart';
import 'package:timetable_app/shared/presentation/widgets/loading_indicator_block.dart';


class LessonsLoadingBlocManager extends StatefulWidget {
  const LessonsLoadingBlocManager({
    super.key,
		required this.builder,
  });

	final Widget Function(
		BuildContext context,
		Future<void> Function() onRefreshRequested
	) builder;

  @override
  State<LessonsLoadingBlocManager> createState() => _LessonsLoadingBlocManagerState();
}

class _LessonsLoadingBlocManagerState extends State<LessonsLoadingBlocManager> {

	Future<void> _onRefreshRequested(BuildContext context) async {
		context.read<TimetableLoadingBloc>().add(TimetableLoadingUpdateEvent());
		await _refreshCompleter.future;
	}

	final Completer<void> _refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimetableLoadingBloc, TimetableLoadingBlocState>(
    	builder: (BuildContext context, TimetableLoadingBlocState loadingState) {
				if (loadingState is! TimetableInitialLoadingInProcessState &&
					loadingState is! TimetableLoadingInProcessState &&
					!_refreshCompleter.isCompleted
				) {
					_refreshCompleter.complete();
				}
				if (loadingState is TimetableLoadingInitialState) { return SizedBox.expand(); }
    		if (loadingState is TimetableInitialLoadingInProcessState) { return LoadingIndicatorBlock(); }
    		if (loadingState is TimetableInitialLoadingErrorState) { return ErrorMessageBlock(circumstances: "загрузке пар", errorMessage: loadingState.error, onRetry: () { context.read<TimetableLoadingBloc>().add(TimetableLoadingEnsureDataLoadedEvent()); },); }

    		return Column(
    			children: [
    				if (loadingState is TimetableLoadingInProcessState)
    				Padding(
    				  padding: const EdgeInsets.symmetric(vertical: 16.0),
    				  child: Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									Text("Данные обновляются...", style: TextStyle(color: context.colors.textAccent),),
								],
							),
						),
						Expanded(
							child: widget.builder(
								context,
							() => _onRefreshRequested(context),
							),
						),
					],
				);
			},
		);
	}
}

