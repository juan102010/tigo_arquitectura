import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class TelevisionScreen extends StatelessWidget {
  TelevisionScreen({Key? key}) : super(key: key);

  List<String> imagenes = [
    "https://ayuda.tigo.com.co/hc/article_attachments/360069702874/banner-movil-conoce-ONEtv.png",
    "https://www.enter.co/wp-content/uploads/2017/09/tvtv.jpg",
    "https://opinioninternet.com/wp-content/uploads/2020/09/20201008_142815_0000.png",
    "https://selectra.com.co/sites/selectra.com.co/files/styles/article_hero/public/images/tv-tigo-825x293_0.png?itok=neyTMJMW",
    "https://ayuda.tigo.com.co/hc/article_attachments/360069698874/ONEtv.png"
  ];
  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(
        'https://www.tigo.com.co/promo/nacional?parametro1=search&parametro2=sem&parametro3=co-home-mkt_search_performance_home_200megas36ksur_sem_cpl_sur_purebrand&gclid=CjwKCAjw5P2aBhAlEiwAAdY7dEolpc1Lsmik5dcCS7d7vdFJnwAQVoPshjpZ88qAvPqCsqpmjoN8ERoC8HcQAvD_BwE&gclsrc=aw.ds');
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
