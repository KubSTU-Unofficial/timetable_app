import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:timetable_app/features/initial_settings/presentation/bloc/init_page_bloc.dart';
import 'package:timetable_app/features/initial_settings/presentation/widgets/error_message_block.dart';
import 'package:timetable_app/features/initial_settings/presentation/widgets/loading_indicator_block.dart';
import 'package:timetable_app/routing/router.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';
import 'package:timetable_app/shared/presentation/widgets/autocomplete_field.dart';

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
		return Scaffold(
			backgroundColor: AppColors.background,
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
						InitPageLoading() || InitPageSetupFinished() => LoadingIndicatorBlock(),
						InitPageError(errorMessage: final msg) => ErrorMessageBlock(
							circumstances: "загрузке списка групп",
							errorMessage: msg,
							onRetry: () => context.read<InitPageBloc>().add(InitEvent()),
						),
						InitPageLoaded(groups: final groups) => 
						Center(
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									SvgPicture.asset(
										"assets/logo.svg",
										width: 120, // задайте нужный размер
										height: 120,
										colorFilter: ColorFilter.mode(
											Color.fromARGB(0xff, 0xF9, 0x72, 0x16), // Ваш RGB цвет (Alpha, R, G, B)
											BlendMode.srcIn, // Режим наложения: заменяет все непрозрачные пиксели цветом
										),
									),
									Padding(
										padding: const EdgeInsets.all(16.0),
										child: Text(
											textAlign: TextAlign.center,
											"Впишите название своей группы, чтобы мы могли загрузить ваше расписание",
											style: TextStyle(
												color: AppColors.textAccent,
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
									  		setState(() { _showGroupNotSelectedMsg = false;	});
									  	},
									  	optionsBuilder: (value) {
									  		if (value.text.isEmpty) { return const Iterable.empty(); }
									  		return groups.where(
									  		(group) => group.name.toLowerCase().contains(value.text.toLowerCase())
									  		).map((group) => group.name).take(20);
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
												color: AppColors.error,
												fontSize: 18,
												fontWeight: FontWeight.bold,
											),
										),
									),
									const SizedBox(height: 32),
									TextButton(
										onPressed: () async {
											if (groups.indexWhere((e) => e.name == _groupController.text) == -1) {
												setState(() { _showGroupNotSelectedMsg = true;	});
												return;
											}
											context.read<InitPageBloc>().add(SetupFinishedEvent(group: _groupController.text));
										},
										style: TextButton.styleFrom(
											backgroundColor: AppColors.primary,
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
											style: TextStyle(color: AppColors.textPrimary),
										),
									),
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
