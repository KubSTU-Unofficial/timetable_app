import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timetable_app/features/teachers_page/presentation/bloc/teachers_page_bloc.dart';
// заглушка, макет будущей страницы не более

//context.colors
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';
import 'package:timetable_app/shared/presentation/widgets/autocomplete_field.dart';
import 'package:timetable_app/shared/presentation/widgets/date_selector.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message_block.dart';
import 'package:timetable_app/shared/presentation/widgets/lesson_widget.dart';
import 'package:timetable_app/shared/presentation/widgets/loading_indicator_block.dart';

class TeachersPage extends StatefulWidget {
	const TeachersPage({super.key});

	@override
	State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {

	final TextEditingController _controller = TextEditingController();
	DateTime date = DateTime.now();
	String name = "";

	void _setDate(BuildContext context, DateTime newDate) {
		setState(() {
			date = newDate;
			context.read<TeachersPageBloc>().add(TeacherLessonsRequestedForDateEvent(
				name: name,
				date: newDate,
			));
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: context.colors.background,
			body: SafeArea(
				child: BlocBuilder<TeachersPageBloc, TeachersPageBlocState>(
					builder: (context, state) {
						return switch (state) {
							TeachersPageInitialState() => LoadingIndicatorBlock(),
							TeachersPageTeachersErrorState(error: final error) => ErrorMessageBlock(
								errorMessage: error, circumstances: "загрузке преподавателей", onRetry: () => context.read<TeachersPageBloc>().add(TeachersPageInitEvent())),
							TeachersPageLoadedState() => Center(
								child: Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										Padding(
										  padding: const EdgeInsets.symmetric(
												horizontal: 16.0,
											),
										  child: AutocompleteField(
										  	label: "Имя преподавателя",
										  	controller: _controller,
										  	autofocus: false,
										  	onSelected: (value) {
										  		if (value == null) return;
										  		setState(() {
										  			name = value.toString();
										  		});
										  		context.read<TeachersPageBloc>().add(
										  			TeacherLessonsRequestedForDateEvent(
										  				name: value.toString(),
										  				date: date,
										  			)
										  		);
										  	},
										  	optionsBuilder: (value) {
										  		if (value.text.isEmpty) {
										  			return const Iterable.empty();
										  		}
										  		return state.teachers.where(
										  			(t) => t.toLowerCase()
										  				.contains(value.text.toLowerCase())
										  			);
										  	}
										  ),
										),
										if(state.error != null)
										ErrorMessage(
											circumstances: 'загрузке пар',
											error: state.error!,
											direction: ErrorMessage.down,
										),
										if (state.lessons != null)
										Row(
											mainAxisAlignment: MainAxisAlignment.spaceAround,
											children: [
												IconButton(
													onPressed: () => _setDate(context, date.add(Duration(days: -7))),
													icon: Icon(Icons.arrow_circle_left_outlined)
												),
												IconButton(
													onPressed: () => _setDate(context, date.add(Duration(days: -1))),
													icon: Icon(Icons.arrow_left)
												),
												Row(
												  children: [
												    IconButton(
												    	onPressed: () {
												    		showDateSelector(
												    			context,
												    			(selectedDate) => _setDate(context, selectedDate),
												    		);
												    	},
												    	icon: Row(
																spacing: 8.0,
												    	  children: [
																	Text(DateFormat("dd:MM:yyyy").format(date)),
												    	    Icon(Icons.calendar_month),
												    	  ],
												    	)
												    ),
												  ],
												),
												IconButton(
													onPressed: () => _setDate(context, date.add(Duration(days: 1))),
													icon: Icon(Icons.arrow_right)
												),
												IconButton(
													onPressed: () => _setDate(context, date.add(Duration(days: 7))),
													icon: Icon(Icons.arrow_circle_right_outlined)
												),
											],
										),
										if (state.lessons != null)
										Expanded(
										  child: StreamBuilder(
										  	stream: state.lessons,
										  	builder: (context, asyncSnapshot) {
										  		if (asyncSnapshot.data == null || asyncSnapshot.data!.isEmpty) {
										  			return Text("Пар нет");
										  		}
										  		return ListView.separated(
										  			itemCount: asyncSnapshot.data!.length,
														separatorBuilder: (context, index) {
															return SizedBox(height: 8,);
														},
										  			itemBuilder: (context, index) {
										  				return LessonWidget(
																lesson: asyncSnapshot.data![index],
																showTeacher: false,
																showGroup: true,
															);
										  			}
										  		);
										  	}
										  ),
										)
									],
								),
							),
						};
					},
				),
			),
		);
	}
}
