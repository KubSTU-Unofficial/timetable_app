import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/shared/presentation/bloc/timetable_loading_bloc.dart';
import 'package:timetable_app/shared/presentation/error_message.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';
import 'package:timetable_app/shared/presentation/widgets/loading_indicator_block.dart';
import 'package:intl/intl.dart';


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
    		return Column(
    			children: [
    				if (loadingState is TimetableLoadingErrorState)
    				ErrorMessage(circumstances: "загрузке пар", error: loadingState.error, direction: ErrorMessage.down,),
    				if (loadingState is TimetableLoadingInProcessState)
    				Padding(
    				  padding: const EdgeInsets.symmetric(vertical: 16.0),
    				  child: Row(
    				  	mainAxisAlignment: .center,
    				    children: [
									Text("Данные обновляются...", style: TextStyle(color: AppColors.textAccent),),
    				    ],
    				  ),
    				),
    				if (loadingState is TimetableLoadingReadyState)
    				Padding(
    				  padding: const EdgeInsets.symmetric(vertical: 16.0),
    				  child: Text("Данные обновлены в ${DateFormat('dd-MM-yyyy, HH:mm').format(loadingState.updatedAt)}", style: TextStyle(color: AppColors.textAccent),),
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

