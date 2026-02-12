import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Core
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/schedule_page/presentation/pages/schedule_page.dart';

// Shared
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';

// Виджеты
import 'package:timetable_app/shared/presentation/widgets/main_navigation_screen.dart';

// Bloc
import 'package:timetable_app/features/initial_settings_page/presentation/bloc/init_page_bloc.dart';

// Экраны
import 'package:timetable_app/features/home/presentation/pages/home_page.dart';
import 'package:timetable_app/features/exams_page/presentation/pages/exams_page.dart';
import 'package:timetable_app/features/app_settings_page/presentation/pages/app_settings_page.dart';
import 'package:timetable_app/features/initial_settings_page/presentation/pages/init_page.dart';
import 'package:timetable_app/features/teachers_page/presentation/pages/teachers_page.dart';

const String homePagePath = "/";
const String initPagePath = "/init";
const String examsPagePath = "/exams";
const String teachersPagePath = "/teachers";
const String schedulePagePath = "/schedule";
const String settingsPagePath = "/settings";

final router = GoRouter(
  initialLocation: homePagePath,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainNavigationScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: teachersPagePath,
              builder: (ctx, state) => TeachersPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: schedulePagePath,
              builder: (ctx, state) => SchedulePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: homePagePath,
              builder: (ctx, state) {
                return HomePage();
              },
              redirect: (ctx, state) async {
                if ((getIt.get<SharedPreferences>().getString(
                      userGroupKey,
                    ) ??
                    "") == "") {
                  return initPagePath;
                }
                return null;
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: examsPagePath, builder: (ctx, state) => ExamsPage()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: settingsPagePath,
              builder: (ctx, state) => AppSettingsPage(),
            ),
          ],
        ),
      ],
    ),
		GoRoute(
			path: initPagePath,
			builder: (ctx, state) {
				return BlocProvider(
					create: (ctx) => InitPageBloc()..add(InitEvent()),
					child: InitPage(),
				);
			},
		),
	],
);
