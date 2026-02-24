import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Core
import 'package:timetable_app/core/di/get_it.dart';

// Router
import 'package:timetable_app/routing/router.dart';
import 'package:timetable_app/shared/presentation/bloc/theme/theme_bloc.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await configureDependencises();
	runApp(BlocProvider(
		create: (BuildContext context) => ThemeBloc()..add(InitializeThemesEvent()),
		child: const MyApp())
	);
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<ThemeBloc, ThemeBlocState>(
			builder: (context, state) {
				return switch (state) {
					ThemeBlocNonInitializedState() => SizedBox.expand(),
					ThemeBlocReadyState() => MaterialApp.router(
						title: 'Flutter Demo',
						theme: state.colorScheme.light, // Ваши настройки из предыдущего ответа
						darkTheme: state.colorScheme.dark,
						themeMode: state.themeMode,
						// theme: ThemeData(
						//   colorScheme: .fromSeed(seedColor: Colors.deepPurple),
						// ),
						routerConfig: router,
					)
				};
			}
		);
	}
}

