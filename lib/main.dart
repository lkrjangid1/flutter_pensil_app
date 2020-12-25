import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pensil_app/config/config.dart';
import 'package:flutter_pensil_app/config/configs.dart';
import 'package:flutter_pensil_app/locator.dart';
import 'package:flutter_pensil_app/ui/app.dart';
import 'package:flutter_pensil_app/ui/page/common/splash.dart';

void main() async {
  // final config = Configs.sucessHaryanaAppConfig();
  final config = Configs.devConfig();
  // final config = Configs.bramhAppConfig();
  // final config = Configs.shaanAppConfig();

  setUpDependency(config);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final configuredApp = AppConfig(
    config: config,
    child: PensilApp(home: SplashPage()),
  );
  runApp(configuredApp);
}
