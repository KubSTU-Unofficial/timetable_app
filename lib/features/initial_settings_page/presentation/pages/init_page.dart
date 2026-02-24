import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// router
import 'package:timetable_app/routing/router.dart';

// context.colors
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

// Виджеты
import 'package:timetable_app/shared/presentation/widgets/autocomplete_field.dart';

// Bloc
import 'package:timetable_app/features/initial_settings_page/presentation/bloc/init_page_bloc.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message_block.dart';
import 'package:timetable_app/shared/presentation/widgets/loading_indicator_block.dart';

class InitPage extends StatefulWidget {
	const InitPage({super.key});

	@override
	State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
	final TextEditingController _groupController = TextEditingController();
	bool _showGroupNotSelectedMsg = false;

	@override
	Widget build(BuildContext context) {
		final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
		return Scaffold(
			backgroundColor: context.colors.background,
			body: BlocListener<InitPageBloc, InitPageBlocState>(
			listener: (BuildContext context, state) {
				if (state is InitPageSetupFinished) {
						if (context.mounted) {
							context.go(homePagePath);
						}
					}
			},
			child: BlocBuilder<InitPageBloc, InitPageBlocState>(
				builder: (context, state) {
					return switch (state) {
						InitPageInitial() => const SizedBox.shrink(),
						InitPageLoading() ||
						InitPageSetupFinished() => LoadingIndicatorBlock(),
						InitPageError(errorMessage: final msg) => ErrorMessageBlock(
							circumstances: "загрузке списка групп",
							errorMessage: msg,
							onRetry: () => context.read<InitPageBloc>().add(InitEvent()),
						),
						InitPageLoaded(groups: final groups) => Center(
							child: Column(
								children: [
									Spacer(flex: 1,),
									Flexible(
										flex: 2,
									  child: AnimatedContainer(
									  	duration: !isKeyboardVisible ? Duration(milliseconds: 100) : Duration(milliseconds: 0),
									  	curve: Curves.linear,
									  	height: isKeyboardVisible ? 0 : 210, // Чуть больше высоты картинки для отступа
									  	width: isKeyboardVisible ? 0 : 210, // Чуть больше высоты картинки для отступа
									  	child: Center(
									  		child: Card(
									  			shape: RoundedRectangleBorder(
									  				side: BorderSide(color: context.colors.primary, width: 2),
									  			),
									  			elevation: 0,
									  			color: Colors.transparent,
									  			child: SvgPicture.asset(
									  				'assets/logo.svg',
									  				colorFilter: ColorFilter.mode(
									  					context.colors.primary,
									  					BlendMode.srcOut,
									  				),
									  				width: 200,
									  				height: 200,
									  			),
									  		),
									  	),
									  ),
									),
									const SizedBox(height: 10,),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: Text(
											textAlign: TextAlign.center,
											"Впишите название своей группы, чтобы мы могли загрузить ваше расписание",
											style: TextStyle(
												color: context.colors.textAccent,
												fontSize: 20,
												fontWeight: FontWeight.bold,
											),
										),
									),
									const SizedBox(height: 10),
									Padding(
										padding: const EdgeInsets.symmetric(horizontal: 16.0),
										child: AutocompleteField(
											label: "Например: 22-КБ-ИВ1",
											controller: _groupController,
											onSelected: (value) {
												setState(() {
													_showGroupNotSelectedMsg = false;
												});
											},
											optionsBuilder: (value) {
												if (value.text.isEmpty) {
														return const Iterable.empty();
													}
												return groups
													.where(
													(group) => group.name
														.toLowerCase()
														.replaceAll(RegExp(r"[-\s]"), "")
														.contains(
															value.text
																.toLowerCase()
																.replaceAll(RegExp(r"[-\s]"), "")
															),
													)
													.map((group) => group.name)
													.take(20);
											},
										),
									),
									if (_showGroupNotSelectedMsg)
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: Text(
											textAlign: TextAlign.center,
											"Введено неверное значение. Пожалуйста, выберите группу из списка или введите заново свою группу",
											style: TextStyle(
												color: context.colors.error,
												fontSize: 18,
												fontWeight: FontWeight.bold,
											),
										),
									),
									const SizedBox(height: 32),
									TextButton(
										onPressed: () async {
											if (groups.indexWhere(
															(e) => e.name == _groupController.text,
														) ==
														-1) {
													setState(() {
														_showGroupNotSelectedMsg = true;
													});
													return;
												}
											context.read<InitPageBloc>().add(
												SetupFinishedEvent(group: _groupController.text),
											);
										},
										style: TextButton.styleFrom(
											backgroundColor: context.colors.primary,
											padding: const EdgeInsets.symmetric(
												horizontal: 24,
												vertical: 12,
											),
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(8),
											),
										),
										child: Text(
											"Продолжить",
											style: TextStyle(color: context.colors.textPrimary),
										),
									),
									Spacer(flex: 2,),
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
