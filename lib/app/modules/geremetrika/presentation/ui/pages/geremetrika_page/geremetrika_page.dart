import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/add_item_order_page/add_item_order_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/itens_page/itens_order_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/order_head_page/order_head_page.dart';

class GeremetrikaPage extends StatefulWidget {
  const GeremetrikaPage({super.key});

  @override
  State<GeremetrikaPage> createState() => _GeremetrikaPageState();
}

class _GeremetrikaPageState extends State<GeremetrikaPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                      width: size.width * 0.1,
                      child: Image.asset('assets/images/logo_premier.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: size.width * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddItemOrderPage(),
                        ),
                      );
                    },
                    child: const Text('Adicionar Item'),
                  ),
                ),
                const SizedBox(height: 10),
                const Expanded(child: ItensOrderPage()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
