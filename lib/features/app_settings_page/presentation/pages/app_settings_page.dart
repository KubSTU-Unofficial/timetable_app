import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

//router
import 'package:timetable_app/routing/router.dart';

//core
import 'package:timetable_app/core/di/get_it.dart';

//shared
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';
import 'package:timetable_app/shared/presentation/bloc/theme/theme_bloc.dart';
import 'package:timetable_app/shared/presentation/theme/app_color_scheme.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class AppSettingsPage extends StatelessWidget {
	const AppSettingsPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: context.colors.background,
			appBar: AppBar(
				title: const Text('Настройки приложения'),
				centerTitle: true,
			),
			body: SafeArea(
				child: BlocBuilder<ThemeBloc, ThemeBlocState>(
					builder: (context, state) {
						// Если состояние не готово, показываем загрузку
						if (state is! ThemeBlocReadyState) {
						return const Center(child: CircularProgressIndicator());
					}

						return ListView(
							padding: const EdgeInsets.all(16.0),
							children: [
								_buildGroupSection(context),
								const Divider(height: 32),
								_buildThemeDropdown(context, state),
								const SizedBox(height: 16),
								_buildColorSchemeDropdown(context, state),
							],
						);
					},
				),
			),
		);
	}

	/// Секция смены группы
	Widget _buildGroupSection(BuildContext context) {
		return ListTile(
			title: const Text("Аккаунт"),
			subtitle: const Text("Сбросить текущие настройки группы"),
			trailing: ElevatedButton(
				onPressed: () => _resetUserGroup(context),
				child: Text("Сменить", style: TextStyle(color: context.colors.textBody),),
			),
		);
	}

	/// Выбор темы (Светлая/Темная/Системная)
	Widget _buildThemeDropdown(BuildContext context, ThemeBlocReadyState state) {
		return ListTile(
			title: const Text("Тема оформления"),
			trailing: DropdownButton<ThemeMode>(
			value: state.themeMode,
			onChanged: (mode) {
				if (mode != null) {
					context.read<ThemeBloc>().add(SetThemeModeEvent(mode.name));
				}
			},
			items: const [
				DropdownMenuItem(value: ThemeMode.light, child: Text("Светлая")),
				DropdownMenuItem(value: ThemeMode.dark, child: Text("Темная")),
				DropdownMenuItem(value: ThemeMode.system, child: Text("Системная")),
			],
		),
		);
	}

	/// Выбор цветовой схемы
	Widget _buildColorSchemeDropdown(BuildContext context, ThemeBlocReadyState state) {
		final schemes = getIt.get<List<AppColorScheme>>();

		return ListTile(
			title: const Text("Цветовая схема"),
			trailing: DropdownButton<AppColorScheme>(
			value: state.colorScheme,
			onChanged: (scheme) {
				if (scheme != null) {
					context.read<ThemeBloc>().add(SetColorSchemeEvent(scheme.name));
				}
			},
			items: schemes.map((scheme) => DropdownMenuItem(
				value: scheme,
				child: Text(scheme.name),
			)).toList(),
		),
		);
	}

	/// Логика сброса группы
	Future<void> _resetUserGroup(BuildContext context) async {
		await getIt.get<SharedPreferences>().setString(userGroupKey, "");
		if (context.mounted) {
		context.go(homePagePath);
	}
	}

}
