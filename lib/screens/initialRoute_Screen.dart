import 'package:card_swiper/card_swiper.dart';
import 'package:fl_app_tigo/screens/screns.dart';
import 'package:flutter/material.dart';
import 'package:fl_app_tigo/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_whatsapp/open_whatsapp.dart';

class InitialRoute extends StatelessWidget {
  static const String routerName = 'initialRoute';

  InitialRoute({Key? key}) : super(key: key);

  List<String> imagenes = [
    "https://tigo-hogar.com.co/p/td/assets/img/promociones-octubre-2022.png",
    "https://cazaofertas.com.co/wp-content/uploads/2020/03/tigo-2x1-1.jpg",
    "https://comparaiso.com.co/sites/comparaiso.com.co/files/2022-09/promociones%20tigo.png",
    "https://internethogares.co/static/images/kv/KV%20TRIPLE%20CELULAR.png",
    "https://ayuda.tigo.com.co/hc/article_attachments/360100971853/banner-oferta-movil-promocional.png"
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
          title: const Text('HOME'),
        ),
        drawer: const SideMenu(),
        body: Column(
          children: [
            _SwiperProm(imagenes: imagenes),
            _btnProm(),
            const _BtnServices(),
            _btnwhatsapp(),
          ],
        ));
  }

  ElevatedButton _btnwhatsapp() {
    return ElevatedButton.icon(
        onPressed: () {
          FlutterOpenWhatsapp.sendSingleMessage(
              "573044245853", "Solicito un servico");
        },
        icon: const Icon(Icons.whatsapp_outlined),
        label: const Text('Contactanos'));
  }

  Container _btnProm() {
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

class _BtnServices extends StatelessWidget {
  const _BtnServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 300,
      color: Colors.blueGrey.shade50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: RichText(
                text: TextSpan(
                  text:
                      'En Tigo tenemos un propósito, y queremos lograrlo en un ',
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(
                        text:
                            'marco de respeto, responsabilidad y cumplimiento de la normatividad colombiana.'),
                    TextSpan(
                        text:
                            'Como una herramienta para estar alineados como compañía y como una forma darlo a conocer,'),
                    TextSpan(
                        text:
                            'te invitamos a consultar nuestras políticas corporativas: Políticas sobre política pública,'),
                    TextSpan(
                        text:
                            'protección de datos, sostenibilidad y diversidad')
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ServicesScreen()));
                  },
                  child: const Text(
                    'Conoce mas sobre nuestros servicios',
                  )),
            ),
          ],
        ),
      ),
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
    return SizedBox(
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
        ));
  }
}
