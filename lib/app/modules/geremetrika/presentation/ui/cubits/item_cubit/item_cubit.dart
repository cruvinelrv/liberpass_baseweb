// ignore_for_file: prefer_const_constructors
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liberpass_baseweb/app/modules/itens_management/domain/entities/item_entity.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/list_item_entity.dart';
import '../../../../data/models/models.dart';
import 'states/item_calculate_state.dart';
import 'states/states.dart';

class ItemCubit extends Cubit<ItemStates> {
  ListItemEntity listItensEntity = ListItemEntity([]);
  late ListItemEntity actualListItens = ListItemEntity([]);
  String description = '';
  double price = 0;
  String unitMeasure = '';
  double quantity = 0;
  double totalPriceValue = 0;
  double widthMeasure = 0;
  double heightMeasure = 0;
  double totalMetrosQuadrados = 0;
  double measureMeterBilling = 0;
  String converteMeasureMeterBilling = '';

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
    emit(const ItemLoadingState());
    double totalM2 = ((widthMeasure * heightMeasure) / 1000000);
    totalMetrosQuadrados = totalM2; // Valor em metros quadrados

    double valorArredondado =
        (totalMetrosQuadrados * 1000000).ceilToDouble() / 1000000;

    int valorArredondadoMilimetros = (valorArredondado * 1000).toInt();
    int valorArredondadoMultiplo50 =
        (valorArredondadoMilimetros / 50).ceil() * 50;
    converteMeasureMeterBilling =
        (valorArredondadoMultiplo50.toDouble()).toStringAsFixed(2);
    measureMeterBilling = double.parse(converteMeasureMeterBilling);
    print('Valor em metros quadrados: $totalMetrosQuadrados');
    print(
        'Valor em milímetros quadrados arredondado: $valorArredondadoMultiplo50');
    emit(const ItemCalculateState());
  }

  void roundMeasure() {
    // double measure = value / 1000000;
  }
}
