import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

//router
import 'package:timetable_app/routing/router.dart';

//core
import 'package:timetable_app/core/di/get_it.dart';

//shared
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Center(child: Text('Настройки приложения')),
              ElevatedButton(
                onPressed: () async {
                  await getIt.get<SharedPreferences>().setString(
                    userGroupKey,
                    "",
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
      ),
    );
  }
}
