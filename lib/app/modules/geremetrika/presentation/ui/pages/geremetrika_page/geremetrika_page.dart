import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/add_item_order_page/add_item_order_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/itens_page/itens_order_page.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/pages/order_head_page/order_head_page.dart';

import '../../cubits/item_cubit/item_cubit.dart';

class GeremetrikaPage extends StatefulWidget {
  const GeremetrikaPage({super.key});

  @override
  State<GeremetrikaPage> createState() => _GeremetrikaPageState();
}

class _GeremetrikaPageState extends State<GeremetrikaPage> {
  late final ItemCubit _itemCubit;

  @override
  void initState() {
    super.initState();
    _itemCubit = Modular.get<ItemCubit>();
  }

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
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      border: Border.all(
                        color: Colors.grey[400]!,
                        width: 1,
                      ),
                    ),
                    child: const ItensOrderPage(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
