import 'package:flutter/material.dart';

class LiberpassInfoPage extends StatefulWidget {
  const LiberpassInfoPage({super.key});

  @override
  State<LiberpassInfoPage> createState() => _LiberpassInfoPageState();
}

class _LiberpassInfoPageState extends State<LiberpassInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liberpass - Seja dono do seu sucesso'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(50),
            child: Text(
                'Liberpass é um projeto pensado com o intuito de gerir vários aspectos de nossa vida, tanto pessoal como profissional. A premissa é criar um perfil e a partir dele definir metas e objetivos. A partir daí a nossa plataforma vai ajudar as pessoas a conquistar os seus sonhos alicerçados na educação financeira e na busca pela qualidade de vida. Queremos que nossa plataforma seja um passaporte para a sua liberdade.',
                style: TextStyle(fontSize: 20)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('Conectar'),
          ),
        ],
      )),
    );
  }
}
