import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

// Виджеты
import 'package:timetable_app/shared/presentation/widgets/navigation_bar.dart';



class MainNavigationScreen extends StatelessWidget {
	final StatefulNavigationShell navigationShell;

	const MainNavigationScreen({
		super.key,
		required this.navigationShell,
	});

	static const int homePageIndex = 2;

	@override
	Widget build(BuildContext context) {
		//  final bool hideOnFirstTab = navigationShell.currentIndex == 0;

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
				body: navigationShell,
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
