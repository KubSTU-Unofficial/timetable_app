import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Core
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:timetable_app/features/timetable_page/presentation/bloc/timetable_page_bloc.dart';
import 'package:timetable_app/features/timetable_page/presentation/pages/timetable_page.dart';

// Shared
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';
import 'package:timetable_app/shared/presentation/bloc/timetable_loading_bloc.dart';

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
          BlocProvider(
					create: (ctx) => TimetableLoadingBloc()..add(TimetableLoadingEnsureDataLoadedEvent()),
					child: MainNavigationScreen(navigationShell: navigationShell)
				),
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
              builder: (ctx, state) => BlocProvider(
							create: (ctx) => TimetablePageBloc()..add(TimetablePageLessonsRequested()),
								child: TimetablePage()
							),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: homePagePath,
              builder: (ctx, state) {
                return BlocProvider(
									create: (ctx) => HomePageBloc()..add(HomePageInitEvent()),
									child: HomePage()
								);
              },
              redirect: (ctx, state) async {
                if ((getIt.get<SharedPreferences>().getString(
                      userGroupKey,
                    ) ?? "") == "") {
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
