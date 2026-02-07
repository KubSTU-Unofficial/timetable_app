import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Core
import 'package:timetable_app/core/di/get_it.dart';

// Router
import 'package:timetable_app/routing/router.dart';

// Shared
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? groupName = "";

  @override
  void initState() {
    super.initState();
    groupName = getIt.get<SharedPreferences>().getString(defaultGroupKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Здесь будет расписание для группы $groupName"),
            ElevatedButton(
              onPressed: () async {
                await getIt.get<SharedPreferences>().setBool(
                  isInitializedKey,
                  false,
                );
                if (context.mounted) {
                  context.go(homePagePath);
                }
              },
              child: Text("Назад"),
            ),
          ],
        ),
      ),
    );
  }
}
