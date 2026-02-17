import 'package:flutter/material.dart';
import 'package:timetable_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message_block.dart';
import 'package:timetable_app/shared/presentation/widgets/expansion_title_widget.dart';

class HomePageTab extends StatelessWidget {
	const HomePageTab({
		super.key,
		required this.onRetry,
		this.data,
	});

	final HomePageTabData? data;
	final void Function() onRetry; 

	@override
	Widget build(BuildContext context) {
		if (data == null) {
			return Center(
			  child: Text(
			  	"Выберите дату для показа",
			  	style: TextStyle(
			  		color: AppColors.primary
			  	),
			  ),
			);
		}
		if (data!.error != null) {
		  return ErrorMessageBlock(
				errorMessage: data!.error!,
				circumstances: "загрузке пар",
				onRetry: onRetry
			);
		}
		return StreamBuilder(
		  stream: data!.lessons,
		  builder: (context, asyncSnapshot) {
				if (asyncSnapshot.data == null) { return SizedBox.shrink(); }
				List<Lesson> lessons = asyncSnapshot.data!;


				// Используй lessons здесь


		    return Center(
		    	child: Padding(
		    		padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
		    		child: ListView.separated(
		    			itemCount: 3,
		    			separatorBuilder: (context, index) =>
		    				SizedBox(height: 8),
		    			itemBuilder: (context, index) =>
		    				ExpansionTitleWidget(),
		    		),
		    	),
		    );
		  }
		);
	}
}
