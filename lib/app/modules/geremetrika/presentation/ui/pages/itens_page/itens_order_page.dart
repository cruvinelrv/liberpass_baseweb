import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/list_item_entity.dart';

import '../../cubits/item_cubit/item_cubit.dart';
import '../../cubits/item_cubit/states/states.dart';

class ItensOrderPage extends StatefulWidget {
  const ItensOrderPage({super.key});

  @override
  State<ItensOrderPage> createState() => _ItensOrderPageState();
}

class _ItensOrderPageState extends State<ItensOrderPage> {
  late final ItemCubit _itemCubit;
  late ListItemEntity _itensList;
  @override
  void initState() {
    super.initState();
    _itemCubit = Modular.get<ItemCubit>();
    _itensList = _itemCubit.actualListItens;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemStates>(
        bloc: _itemCubit,
        builder: (context, state) {
          if (state is ItemLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ItemSuccessState || state is ItemInitialState) {
            _itensList = _itemCubit.actualListItens;
            return ListView.builder(
              itemCount: _itensList.listItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        _itensList.listItems[index].descriptionItem.toString()),
                    subtitle: Text(
                        _itensList.listItems[index].unitMeasure.toString()),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            _itemCubit.removeItem(
                                item: _itensList.listItems[index]);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            _itemCubit.editItem(
                                item: _itensList.listItems[index]);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        Text(
                            'R\$ ${_itensList.listItems[index].listPrices![0]['salePrice']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('Nenhum item encontrado'),
          );
        });
  }
}
