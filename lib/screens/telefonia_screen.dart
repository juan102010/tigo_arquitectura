import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class TelefoniaScreen extends StatelessWidget {
  TelefoniaScreen({Key? key}) : super(key: key);

  List<String> imagenes = [
    "https://lh3.googleusercontent.com/p/AF1QipPqWS--12sC9t4U_3zpgz-9i5jjsW3AJw43KS7G=w768-h768-n-o-v1",
    "https://directoriodigitalcomercial.com.co/wp-content/uploads/2021/11/72b04ab0-a95d-41b7-9f83-88e093a4ea87-650x1024.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc66z-xHOXKBrqSqgpzz_0P_5B9vxrr2SHcw&usqp=CAU",
    "https://pbs.twimg.com/media/Esn2cjJXYAArtdv.jpg",
    "https://loaaq.com/colombia/wp-content/uploads/sites/2/2020/06/Ecard-cuadrada-Clasica-HD2-scaled.jpeg"
  ];
  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(
        'https://tigo-hogar.com.co/p/tigo-contratar-I6/ofertas-tigo.html?keyword=Tigo%20Telefonia&gclid=CjwKCAjw5P2aBhAlEiwAAdY7dM6imk_w1L5TskXlVK-SdbQNqXOcQ2CDjkDOaHq7ka2gl6NFRWV5uxoCrF8QAvD_BwE');
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Area de Servicios de Telefonia'),
        ),
        body: Column(
          children: [
            _SwiperProm(imagenes: imagenes),
            _btnprom(),
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: [
                  Title(
                      color: Colors.black,
                      child: const Text(
                        'Tienes algun problema contactanos',
                        style: TextStyle(fontSize: 18),
                      )),
                  Container(
                    width: 250,
                    height: 30,
                    margin: EdgeInsets.all(30),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          FlutterOpenWhatsapp.sendSingleMessage(
                              "573044245853", "Solicito un servico");
                        },
                        icon: Icon(Icons.whatsapp_outlined),
                        label: Text('por medio de whatsApp')),
                  ),
                  Container(
                    width: 250,
                    height: 30,
                    margin: EdgeInsets.all(30),
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.book),
                        label: Text('por este medio')),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Container _btnprom() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 20, 5, 0),
      child: ElevatedButton(
          onPressed: () {
            _launchUrl();
          },
          child: const Text(
            'Conoce mas sobre nuestras promociosnes',
          )),
    );
  }
}

class _SwiperProm extends StatelessWidget {
  const _SwiperProm({
    Key? key,
    required this.imagenes,
  }) : super(key: key);

  final List<String> imagenes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          width: double.infinity,
          height: 200.0,
          child: Swiper(
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                imagenes[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: 5,
            pagination: const SwiperPagination(),
            control: const SwiperControl(),
          )),
    );
  }
}
