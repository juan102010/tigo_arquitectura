import 'package:flutter/material.dart';

import 'package:fl_app_tigo/screens/screns.dart';

import '../models/menu_option.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOption = <MenuOption>[
    MenuOption(
      route: 'home',
      name: 'home',
      screen: const HomeScreen(),
    ),
    MenuOption(
      route: InitialRoute.routerName,
      name: 'initialRoute',
      screen: const InitialRoute(),
    ),
    MenuOption(
      route: SettingsScreen.routerName,
      name: 'settings',
      screen: const SettingsScreen(),
    ),
    MenuOption(
      route: 'login',
      name: 'login',
      screen: LoginScreen(),
    )
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }
}
