import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liberpass - Sistema de Gestão Completo'),
      ),
      body: Center(
          child: Wrap(
        spacing: 10,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: <Widget>[
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 180,
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    child: const Text('Liberpass',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/liberpass-info');
                  },
                ),
              ]),
          const SizedBox(height: 10),
          GestureDetector(
            child: Container(
              width: 180,
              height: 70,
              padding: const EdgeInsets.all(10),
              color: Colors.red,
              child: const Text(
                  'LiberStream - Módulo para Streaming de Audio e Vídeo'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/base-page');
            },
          ),
          GestureDetector(
            child: Container(
              width: 180,
              height: 70,
              padding: const EdgeInsets.all(10),
              color: Colors.yellow,
              child: const Text('Serviceiro - Módulo para Gestão de Serviços'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/under-construction');
            },
          ),
          GestureDetector(
            child: Container(
              width: 180,
              height: 70,
              padding: const EdgeInsets.all(10),
              color: Colors.grey,
              child:
                  const Text('Geremetrika - Módulo de Gestão do Ramo Vidreiro'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          GestureDetector(
            child: Container(
              width: 180,
              height: 70,
              padding: const EdgeInsets.all(10),
              color: Colors.purple,
              child:
                  const Text('LiberNômade - Pra quem está sempre em movimento'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/under-construction');
            },
          ),
          GestureDetector(
            child: Container(
              width: 180,
              height: 70,
              padding: const EdgeInsets.all(10),
              color: Colors.amber,
              child: const Text('LiberStart - Pra quem está começando'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/item');
            },
          ),
          GestureDetector(
            child: Container(
              width: 180,
              height: 70,
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              child: const Text(
                  'LiberInvest - Para gerenciar os seus investimentos'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/upload-itens');
            },
          ),
        ],
      )),
    );
  }
}
