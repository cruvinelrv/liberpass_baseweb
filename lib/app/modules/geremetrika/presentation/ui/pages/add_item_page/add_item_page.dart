import 'package:flutter/material.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/data/models/item_model.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/presentation/ui/cubits/item_cubit/item_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  late final ItemCubit _itemCubit;
  final GlobalKey<FormState> _formKeyAddItem = GlobalKey<FormState>();
  final TextEditingController _controllerItemDescription =
      TextEditingController();
  final TextEditingController _controllerItemPrice = TextEditingController();
  final TextEditingController _controllerItemQuantity = TextEditingController();
  final TextEditingController _controllerItemTotalValue =
      TextEditingController();
  final TextEditingController _controllerUnitMeasure = TextEditingController();
  late final FocusNode focus;
  late final FocusNode focusItemDescription;
  late final FocusNode focusItemPrice;
  late final FocusNode focusItemQuantity;
  late final FocusNode focusItemTotalValue;
  late final FocusNode focusUnitMeasure;

  @override
  void initState() {
    super.initState();
    _itemCubit = Modular.get<ItemCubit>();
    focus = FocusNode();
    focusItemDescription = FocusNode()..requestFocus();
    focusItemPrice = FocusNode();
    focusItemQuantity = FocusNode();
    focusItemTotalValue = FocusNode();
    focusUnitMeasure = FocusNode();
  }
  /*
  @override
  void dispose() {
    super.dispose();
    focus.dispose();
    focusItemDescription.dispose();
    focusItemPrice.dispose();
    focusItemQuantity.dispose();
    focusItemTotalValue.dispose();
    focusUnitMeasure.dispose();
    _controllerItemDescription.dispose();
    _controllerItemPrice.dispose();
    _controllerItemQuantity.dispose();
    _controllerItemTotalValue.dispose();
    _controllerUnitMeasure.dispose();
  }
  */

  void clearFields() {
    _controllerItemDescription.clear();
    _controllerItemPrice.clear();
    _controllerItemQuantity.clear();
    _controllerItemTotalValue.clear();
    _controllerUnitMeasure.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Item'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKeyAddItem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _controllerItemDescription,
                            focusNode: focusItemDescription,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Descrição do Item',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _controllerItemPrice,
                            focusNode: focusItemPrice,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Preço do Item',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _controllerItemQuantity,
                            focusNode: focusItemQuantity,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Quantidade do Item',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _controllerItemTotalValue,
                            focusNode: focusItemTotalValue,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Valor Total do Item',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _controllerUnitMeasure,
                            focusNode: focusUnitMeasure,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Unidade de Medida',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          clearFields();
                        },
                        child: const Text('Limpar'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final item = ItemModel(
                            description: _controllerItemDescription.text,
                            price: double.parse(_controllerItemPrice.text),
                            quantity:
                                double.parse(_controllerItemQuantity.text),
                            totalPriceValue:
                                double.parse(_controllerItemTotalValue.text),
                            unitMeasure: _controllerUnitMeasure.text,
                          );
                          _itemCubit.addItem(item: item);
                          Navigator.pop(context);
                        },
                        child: const Text('Salvar'),
                      ),
                    ],
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
