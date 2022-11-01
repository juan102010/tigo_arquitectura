import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class InternetScreen extends StatelessWidget {
  InternetScreen({Key? key}) : super(key: key);

  List<String> imagenes = [
    "https://pbs.twimg.com/media/FKxDsNuWQAgR9Yi?format=png&name=900x900",
    "https://pbs.twimg.com/media/EtqKUhCXcAIL4mo.jpg",
    "https://selectra.com.co/sites/selectra.com.co/files/images/internet-hogar-tigo-825x293.png",
    "https://www.ofertasahora.com/wp-content/uploads/2020/01/Promociones-de-INTERNET-residencial-TIGO-el-salvador-enero-2020.jpg",
    "https://ayuda.tigo.com.bo/hc/article_attachments/4408678326163/mceclip0.png"
  ];
  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(
        'https://tigo-hogar.com.co/p/tigo-internet-I6/ofertas-tigo.html?keyword=Promociones%20Tigo%20Internet&gclid=CjwKCAjw5P2aBhAlEiwAAdY7dFTKYeuzyc_D8XSZ2DhTHmtveNd8QoKvbB-aLrq6I_XlU0ACXzABEhoCE2sQAvD_BwE');
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> _launchwifi() async {
    final Uri _url = Uri.parse('https://www.tigo.com.co/medidor-de-velocidad');
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Area de Servicios de Internet'),
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
                        onPressed: () {
                          _launchwifi();
                        },
                        icon: Icon(Icons.wifi),
                        label: Text('realicemos una prueba')),
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
