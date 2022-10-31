import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/screns.dart';

class botonesInicio extends StatelessWidget {
  const botonesInicio({
    Key? key,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(
        'https://compras.tigo.com.co/movil/pospago?_ga=2.62367215.2122873429.1667166981-1963608461.1662313605&_gac=1.121426426.1663896518.Cj0KCQjwj7CZBhDHARIsAPPWv3fiUzYSXhVyn1EB_HbFI1h7LBXKXXgB87V9FI7EDX8hqrfPbjFXjSoaAvcoEALw_wcB');
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/logo-home.png'),
                    width: 70,
                    height: 70,
                  ),
                  const Text('Accede y'),
                  const Text('gestiona todos'),
                  const Text('tus servicios'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CheckAuthScreen2()));
                      },
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/logo-engranaje.png'),
                    width: 70,
                    height: 70,
                  ),
                  const Text('constuye sonrisas'),
                  const Text('y nuevas'),
                  const Text('experencias'),
                  ElevatedButton(
                      onPressed: () {
                        _launchUrl();
                      },
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ))
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: RichText(
              text: TextSpan(children: [
            const TextSpan(
                style: TextStyle(fontSize: 14, color: Colors.black),
                text: "no tienes cuenta  "),
            TextSpan(
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
                text: "  registrate",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
                  })
          ])),
        ),
      ],
    );
  }
}
