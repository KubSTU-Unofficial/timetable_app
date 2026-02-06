import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/home/presentation/home_page.dart';
import 'package:timetable_app/features/initial_settings/presentation/bloc/init_page_bloc.dart';
import 'package:timetable_app/features/initial_settings/presentation/pages/init_page.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';

const String homePagePath = "/";
const String initPagePath = "/init";

final router = GoRouter(
	initialLocation: homePagePath,
	routes: [
		GoRoute(
			path: homePagePath,
			builder: (ctx, state) {
				return HomePage();
			},
			redirect: (ctx, state) async {
				if (!(getIt.get<SharedPreferences>().getBool(isInitializedKey) ?? false)) {
					return initPagePath;
				}
				return null;
			}
		),
		GoRoute(
			path: initPagePath,
			builder: (ctx, state) {
				return BlocProvider(
					create: (ctx) => InitPageBloc()..add(InitEvent()),
					child: InitPage()
				);
			}
		)
	]
);

