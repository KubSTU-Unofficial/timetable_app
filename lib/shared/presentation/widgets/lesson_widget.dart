import 'package:flutter/material.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class LessonWidget extends StatelessWidget {
  const LessonWidget({super.key, required this.lesson});

	final Lesson lesson;

  @override
  Widget build(BuildContext context) {
		return ExpansionTile(
			tilePadding: EdgeInsets.only(
				right: 4
			),
		  title: _Title(lesson: lesson),
      iconColor: AppColors.focusedBorder,
      collapsedIconColor: AppColors.enabledBorder,
      textColor: AppColors.textAccent,
      collapsedTextColor: Colors.black,
      backgroundColor: AppColors.darkBackground,
      collapsedBackgroundColor: AppColors.darkBackground,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.focusedBorder, width: 1),
        borderRadius: BorderRadius.only(
					topLeft: Radius.circular(3),
					topRight: Radius.circular(3),
				),
      ),
		  children: [
				Padding(
				  padding: const EdgeInsets.all(8.0),
				  child: _Body(lesson: lesson,),
				)
			],
		);
	}
}

class _Body extends StatelessWidget {
	const _Body({required this.lesson});

	final Lesson lesson;

	@override
	Widget build(BuildContext context) {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: [
				if (lesson.timing.weeks != null)
				Text(
					"Период: с ${lesson.timing.weeks!.from} по ${lesson.timing.weeks!.to} неделю;",
					style: TextStyle(
						color: Colors.white,
						fontSize: 14,
					),
				),
				if (lesson.timing.date != null)
				Text(
					"Дата: ${lesson.timing.date!.day}.${lesson.timing.date!.month}.${lesson.timing.date!.year}",
					style: TextStyle(
						color: Colors.white,
						fontSize: 14,
					),
				),
				if (lesson.percentOfGroup != 100)
				Text(
					"Процент группы: ${lesson.percentOfGroup}",
					style: TextStyle(
						color: Colors.white,
						fontSize: 14,
					),
				),
				if (lesson.isInLectureHall == true)
				Text(
					"В лекционной аудитории: да",
					style: TextStyle(
						color: Colors.white,
						fontSize: 14,
					),
				),
				if (lesson.isOnline == true)
				Text(
					"Онлайн: да",
					style: TextStyle(
						color: Colors.white,
						fontSize: 14,
					),
				),
				if (lesson.comment != null)
				Text(
					"Примечание: ${lesson.comment}",
					style: TextStyle(
						color: Colors.white,
						fontSize: 14,
					),
				),
			],
		);
	}
}

class _Title extends StatelessWidget {
	const _Title({
		required this.lesson,
	});

	final Lesson lesson;

	@override
	Widget build(BuildContext context) {
		return Column(
			children: [
				Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: [
						Row(
							children: [
								Container(
									color: AppColors.darkBrown,
									child: Padding(
										padding: const EdgeInsets.only(
											left: 8,
											right: 4,
										),
										child: Text(
											"${lesson.timing.lessonNumber}",
											style: TextStyle(
												color: Colors.white,
												fontSize: 14,
											),
										),
									),
								),
								Container(
									color: AppColors.primary,
									child: Padding(
										padding: const EdgeInsets.symmetric(
											horizontal: 4
										),
										child: Text(
											lesson.type.translation,
											style: TextStyle(
												color: Colors.white,
												fontSize: 14,
											),
										),
									),
								),
								if (lesson.classroom != null)
								Container(
									color: AppColors.darkBrown,
									child: Padding(
										padding: const EdgeInsets.symmetric(
											horizontal: 4
										),
										child: Text(
											lesson.classroom!,
											style: TextStyle(
												color: Colors.white,
												fontSize: 14,
											),
										),
									),
								),
							],
						),
						Text(
							lesson.timing.lessonTime,
							style: TextStyle(
								color: Colors.white,
								fontSize: 14,
							),
						),
					],
				),
				Padding(
					padding: const EdgeInsets.symmetric(
						horizontal: 8
					),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						spacing: 4,
						children: [
							Text(
								lesson.name,
								style: TextStyle(
									color: Colors.white,
									fontSize: 16,
								),
							),
							if (lesson.teacherName != null)
							Text(
								lesson.teacherName!,
								style: TextStyle(
									color: Colors.white,
									fontSize: 12,
								),
							),
						],
					),
				),
			],
		);
	}
}
