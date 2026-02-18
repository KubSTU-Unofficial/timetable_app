import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/shared/presentation/bloc/timetable_loading_bloc.dart';
import 'package:timetable_app/shared/presentation/error_message.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';
import 'package:timetable_app/shared/presentation/widgets/loading_indicator_block.dart';

class LessonsLoadingBlocManager extends StatelessWidget {
  const LessonsLoadingBlocManager({
    super.key,
		required this.child,
  });

	final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimetableLoadingBloc, TimetableLoadingBlocState>(
    	builder: (BuildContext context, TimetableLoadingBlocState loadingState) {
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
    				  child: Text("Данные обновлены в ${loadingState.updatedAt}", style: TextStyle(color: AppColors.textAccent),),
    				),
    				Expanded(
    					child: child,
    				),
    			],
    		);
    	},
    );
  }
}

