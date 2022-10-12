import 'package:flutter/material.dart';
import 'package:fl_app_tigo/share_preferences/preferences.dart';
import 'package:fl_app_tigo/widgets/widgets.dart';

class InitialRoute extends StatelessWidget {
  static const String routerName = 'initialRoute';

  const InitialRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ruta inicial'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkmode: ${Preferences.isDarkmode}'),
            const Divider(),
            Text('Género: ${Preferences.gender}'),
            const Divider(),
            Text('Nombre de usuario: ${Preferences.name} '),
            const Divider(),
          ],
        ));
  }
}
