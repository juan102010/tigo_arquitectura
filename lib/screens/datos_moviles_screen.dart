import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class DatosMovilesScreen extends StatelessWidget {
  DatosMovilesScreen({Key? key}) : super(key: key);

  List<String> imagenes = [
    "https://pbs.twimg.com/media/Eq-SSI2W4AAdEgB.jpg",
    "https://www.enter.co/wp-content/uploads/2021/04/Screen-Shot-2021-04-24-at-9.56.21-PM.png",
    "https://apollo-virginia.akamaized.net/v1/files/tumi6mkumt9x2-CO/image;s=850x0",
    "https://ayuda.tigo.com.co/hc/article_attachments/1500020026581/C_mo_funcionan_los_datos_en_tu_nuevo_plan_Pospago_Tigo___M_vil.png",
    "https://www.enter.co/wp-content/uploads/2021/04/Screen-Shot-2021-04-24-at-9.55.20-PM-1024x495.png"
  ];
  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(
        'https://compras.tigo.com.co/movil/pospago?_ga=2.62367215.2122873429.1667166981-1963608461.1662313605&_gac=1.121426426.1663896518.Cj0KCQjwj7CZBhDHARIsAPPWv3fiUzYSXhVyn1EB_HbFI1h7LBXKXXgB87V9FI7EDX8hqrfPbjFXjSoaAvcoEALw_wcB');
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Area de Servicios Moviles'),
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
