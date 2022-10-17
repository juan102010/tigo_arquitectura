import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_app_tigo/screens/screns.dart';
import 'package:fl_app_tigo/services/services.dart';

class CheckAuthScreen2 extends StatelessWidget {
  const CheckAuthScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) return const Text('');

            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const LoginScreen(),
                        transitionDuration: const Duration(seconds: 0)));
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const SettingsScreen(),
                        transitionDuration: const Duration(seconds: 0)));
              });
            }

            return Container();
          },
        ),
      ),
    );
  }
}