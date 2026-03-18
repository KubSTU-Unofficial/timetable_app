import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionWidget extends StatefulWidget {
  const AppVersionWidget({super.key});

  @override
  State<AppVersionWidget> createState() => _AppVersionWidgetState();
}

class _AppVersionWidgetState extends State<AppVersionWidget> {
  String _appVersion = 'Загрузка...';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = 'Версия: ${packageInfo.version}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_appVersion, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,));
  }
}
