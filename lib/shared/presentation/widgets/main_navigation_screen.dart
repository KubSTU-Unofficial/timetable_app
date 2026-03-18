import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timetable_app/shared/presentation/bloc/timetable_loading/timetable_loading_bloc.dart';

// Виджеты
import 'package:timetable_app/shared/presentation/widgets/navigation_bar.dart';
import 'package:timetable_app/shared/presentation/widgets/timetable_update_toast_listener.dart';



class MainNavigationScreen extends StatelessWidget {
	final StatefulNavigationShell navigationShell;

	const MainNavigationScreen({
		super.key,
		required this.navigationShell,
	});

	static const int homePageIndex = 2;

	@override
	Widget build(BuildContext context) {

		return PopScope(
			canPop: false,
			onPopInvokedWithResult: (didPop, result) {
				if (didPop) return;

				if (navigationShell.currentIndex != homePageIndex) {
					navigationShell.goBranch(homePageIndex);
				} else {
					SystemNavigator.pop(); 
				}
			},
			child: Scaffold(
				// Тело - отображает активный экран (выбирается navigationShell)
				body: BlocProvider(
					create: (ctx) => TimetableLoadingBloc()..add(TimetableLoadingEnsureDataLoadedEvent()),
					child: TimetableUpdateToastListener(child: navigationShell)
				),
				// Навигационная панель
				bottomNavigationBar: CustomBottomNavigationBar(
					currentIndex: navigationShell.currentIndex,
					onTap: (index) {
						// Переключение между вкладками
						navigationShell.goBranch(
							index,
						);
					},
				),
			),
		);
	}
}
