import 'package:flutter/material.dart';

class imagen_logo extends StatelessWidget {
  const imagen_logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.topCenter,
      color: const Color(0xff06377c),
      child: const Image(
        image: AssetImage('assets/logo.png'),
      ),
    );
  }
}
