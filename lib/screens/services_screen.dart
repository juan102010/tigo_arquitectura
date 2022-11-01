import 'package:fl_app_tigo/screens/screns.dart';
import 'package:flutter/material.dart';

import '../widgets/side_menu.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nuestros servicios'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/telefonia.png'),
                        width: 70,
                        height: 70,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Servicio de telefonia'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TelefoniaScreen()));
                          },
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/internet.png'),
                        width: 70,
                        height: 70,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Servicio de internet'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InternetScreen()));
                          },
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/television.png'),
                        width: 70,
                        height: 70,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Servicio de television'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TelevisionScreen()));
                          },
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/datos.png'),
                        width: 70,
                        height: 70,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Servicio de moviles'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DatosMovilesScreen()));
                          },
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ))
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
