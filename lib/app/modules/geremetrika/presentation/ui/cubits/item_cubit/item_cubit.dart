// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/item_entity.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/list_item_entity.dart';
import '../../../../data/models/models.dart';
import 'states/states.dart';

class ItemCubit extends Cubit<ItemStates> {
  ListItemEntity listItensEntity = ListItemEntity([]);
  late ListItemEntity actualListItens = ListItemEntity([]);
  String description = '';
  double price = 0;
  String unitMeasure = '';
  double quantity = 0;
  double totalPriceValue = 0;

  ItemCubit() : super(const ItemInitialState());

  void addItem({required ItemModel item}) {
    emit(const ItemLoadingState());
    listItensEntity.listItems.add(item);
    actualListItens = listItensEntity;
    emit(const ItemSuccessState());
  }

  void removeItem({required ItemEntity item}) {
    emit(const ItemLoadingState());
    listItensEntity.listItems.remove(item);
    actualListItens = listItensEntity;
    emit(const ItemInitialState());
  }

  void editItem({required ItemEntity item}) {
    emit(const ItemLoadingState());
    listItensEntity.listItems.remove(item);
    actualListItens.listItems.add(item);
    actualListItens = listItensEntity;
    emit(const ItemSuccessState());
  }

  void loadItem() {
    emit(const ItemLoadingState());
  }

  void loadedItem() {
    emit(const ItemLoadedState());
  }

  void errorItem() {
    emit(const ItemErrorState());
  }

  void calculateM2() {
    totalPriceValue = price * quantity;
    emit(const ItemSuccessState());
  }
}
