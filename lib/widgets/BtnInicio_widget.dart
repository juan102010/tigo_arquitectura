import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../screens/screns.dart';

class botonesInicio extends StatelessWidget {
  const botonesInicio({
    Key? key,
  }) : super(key: key);

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
                            builder: (context) => LoginScreen()));
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
                      onPressed: () {},
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
                        builder: (context) => const AlertScreen()));
                  })
          ])),
        ),
      ],
    );
  }
}
