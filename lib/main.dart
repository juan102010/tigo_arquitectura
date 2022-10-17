import 'package:fl_app_tigo/providers/theme_provider.dart';
import 'package:fl_app_tigo/share_preferences/preferences.dart';
import 'package:flutter/material.dart';

import 'package:fl_app_tigo/router/app_routes.dart';
import 'package:provider/provider.dart';
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthService()),
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tigo',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        scaffoldMessengerKey: NotificationsService.messengerKey,
        theme: Provider.of<ThemeProvider>(context).currentTheme);
  }
}
