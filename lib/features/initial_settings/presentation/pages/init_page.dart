import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/initial_settings/presentation/bloc/init_page_bloc.dart';
import 'package:timetable_app/features/initial_settings/presentation/bloc/init_page_bloc_state.dart';
import 'package:timetable_app/features/initial_settings/presentation/bloc/init_page_block_event.dart';
import 'package:timetable_app/routing/router.dart';
import 'package:timetable_app/shared/data/constants.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';
import 'package:timetable_app/shared/presentation/error_message.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
	final bloc = context.read<InitPageBloc>();
    return Scaffold(
			body: BlocBuilder<InitPageBloc, InitPageBlocState>(
			  builder: (context, state) {
			    return Center(
						child: Column(
							mainAxisAlignment: .center,
							children: [
								Padding(
									padding: const EdgeInsets.all(16.0),
									child: Text("(выбери ФиТК для теста выбора группы, ИТК - для теста сообщения об ошибке)"),
								),
								DropdownButton(
									value: state.selectedInstitute,
									hint: Text("Выберите институт"),
									items: institutes.map((e) {
										return DropdownMenuItem(value: e,child: Text(e), );
								}).toList(),
									onChanged: (value) async {
										bloc.add(InstituteSelectedEvent(value));
									},
								),
								if (state.selectedInstitute != null && state.groups.isEmpty && state.errorMessage == null)
								Text("Групп для этого института нет"),
								if (state.groups.isNotEmpty)
								DropdownButton(
									hint: Text("Выберите группу"),
									value: state.selectedGroup,
									items: state.groups.map((e) {
										return DropdownMenuItem(value: e.name, child: Text(e.name));
								}).toList(),
									onChanged: (value) async {
										bloc.add(GroupSelectedEvent(value));
									},
								),
								if (state.errorMessage != null)
								ErrorMessage(circumstances: "загрузке списка групп", error: state.errorMessage!),
								if (state.selectedGroup != null)
								ElevatedButton(
									onPressed: () async {
										await getIt.get<SharedPreferences>().setBool(isInitializedKey, true);
										await getIt.get<SharedPreferences>().setString(defaultGroupKey, state.selectedGroup ?? "");
										if (context.mounted) {
											context.go(homePagePath);
										}
									},
									child: Text("Открыть расписание")
								),
							],
						),
					);
			  }
			),
    );
  }
}
