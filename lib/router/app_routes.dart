import 'package:flutter/material.dart';

import 'package:fl_app_tigo/screens/screns.dart';

import '../models/menu_option.dart';

class AppRoutes {
  static const initialRoute = 'check';

  static final menuOption = <MenuOption>[
    MenuOption(
      route: 'check',
      name: 'check',
      screen: const CheckAuthScreen(),
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
