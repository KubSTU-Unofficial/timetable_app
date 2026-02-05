import 'package:flutter/material.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/routing/router.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await configureDependencises();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
			routerConfig: router,
    );
  }
}

