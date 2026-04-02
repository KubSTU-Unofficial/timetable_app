import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timetable_app/features/app_settings_page/domain/usecases/delete_user_group_data_usecase.dart';

//widgets
import 'package:timetable_app/features/app_settings_page/presentation/widgets/app_version_widget.dart';
import 'package:timetable_app/shared/presentation/widgets/simple_link.dart';

//router
import 'package:timetable_app/routing/router.dart';

//core
import 'package:timetable_app/core/di/get_it.dart';

//shared
import 'package:timetable_app/shared/presentation/bloc/theme/theme_bloc.dart';
import 'package:timetable_app/shared/presentation/theme/app_color_scheme.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key});

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: Column(children: [const Text("Настройки приложения")]),
        titleTextStyle: TextStyle(
          color: context.colors.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
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
              padding: const EdgeInsets.all(10.0),
              children: [
                _buildGroupSection(context),
                const Divider(height: 16),
                _buildThemeDropdown(context, state),
                const SizedBox(height: 5),
                _buildColorSchemeDropdown(context, state),
                const SizedBox(height: 5),
                _developersInfo(context),
                const SizedBox(height: 5),
                _appInfo(context),
                const SizedBox(height: 5),
                _license(context),
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
      title: const Text(
        "Аккаунт",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "Сбросить текущие настройки группы",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: ElevatedButton(
        onPressed: () => _resetUserGroup(context),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(120, 45),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          backgroundColor: context.colors.cardBackground,
        ),
        child: Text(
          "Сменить",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }

  /// Выбор темы (Светлая/Темная/Системная)
  Widget _buildThemeDropdown(BuildContext context, ThemeBlocReadyState state) {
    return ListTile(
      title: const Text(
        "Тема оформления",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton<ThemeMode>(
          iconEnabledColor: context.colors.accent,
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
      ),
    );
  }

  /// Выбор цветовой схемы
  Widget _buildColorSchemeDropdown(
    BuildContext context,
    ThemeBlocReadyState state,
  ) {
    final schemes = getIt.get<List<AppColorScheme>>();

    return ListTile(
      title: const Text(
        "Цветовая схема",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton<AppColorScheme>(
          iconEnabledColor: context.colors.accent,
          value: state.colorScheme,
          onChanged: (scheme) {
            if (scheme != null) {
              context.read<ThemeBloc>().add(SetColorSchemeEvent(scheme.name));
            }
          },
          items: schemes
              .map(
                (scheme) =>
                    DropdownMenuItem(value: scheme, child: Text(scheme.name)),
              )
              .toList(),
        ),
      ),
    );
  }

  /// Логика сброса группы
  Future<void> _resetUserGroup(BuildContext context) async {
    DeleteUserGroupDataUsecase deleteUserDataUsecase = getIt
        .get<DeleteUserGroupDataUsecase>();
    await deleteUserDataUsecase.execute();
    if (context.mounted) {
      context.go(homePagePath);
    }
  }

  /// О разработчиках
  Widget _developersInfo(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: context.colors.accent,
      iconColor: context.colors.primary,
      title: Text(
        "Разработчики",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      shape: BorderDirectional(
        top: BorderSide.none,
        bottom: BorderSide.none,
        start: BorderSide.none,
        end: BorderSide.none,
      ),
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/avatars/avatar_mont3r.jpg'),
              ),
              const SizedBox(width: 10),
              Text(
                "DtheCan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Text(
                "UI/UX",
                softWrap: true,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Row(
            children: [
              CircleAvatar(radius: 20),
              Text(
                "                        ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Business Logic",
                softWrap: true,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/avatars/Electroplayer.png'),
              ),
              const SizedBox(width: 10),
              Text(
                "Electroplayer",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Backend Developer",
                  softWrap: true,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Инфо о приложении
  Widget _appInfo(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "О приложении",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      shape: BorderDirectional(
        top: BorderSide.none,
        bottom: BorderSide.none,
        start: BorderSide.none,
        end: BorderSide.none,
      ),
      collapsedIconColor: context.colors.accent,
      iconColor: context.colors.primary,
      childrenPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      children: [
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [AppVersionWidget()],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Colors.white,
              ),
              child: Image(
                image: AssetImage('assets/GitHub_Invertocat_Black.png'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            SimpleLink(
              text: 'Github',
              url: 'https://github.com/KubSTU-Unofficial/timetable_app/tree/main?tab=readme-ov-file',
            ),
          ],
        ),
      ],
    );
  }

  Widget _license(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "Лицензия",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      shape: BorderDirectional(
        top: BorderSide.none,
        bottom: BorderSide.none,
        start: BorderSide.none,
        end: BorderSide.none,
      ),
      collapsedIconColor: context.colors.accent,
      iconColor: context.colors.primary,
      childrenPadding: const EdgeInsets.fromLTRB(15, 0, 16, 0),
      children: [
        Text("""
Copyright (C) 2026 DtheCan, Electroplayer, Fjerileik-norlod-sym-fjerir
This program comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under certain conditions.
					"""),
      ],
    );
  }
}
