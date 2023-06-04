import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/add_item_page/add_item_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/itens_page/itens_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/order_head_page/order_head_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset('assets/images/logo_premier.png'),
          title: const Text('Geremetrika - Versão Alpha 0.1.0')),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                Wrap(
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      child: const OrderHeadPage(),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: Image.asset('assets/images/logo_premier.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: size.width * 0.2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddItemPage(),
                        ),
                      );
                    },
                    child: const Text('Adicionar Item'),
                  ),
                ),
                const SizedBox(height: 10),
                const Expanded(child: ItensPage()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
