// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/list_item_entity.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/order_entity.dart';
import '../../../../../central_base/sub_modules/wms/domain/entities/item_flow_entity.dart';
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
  OrderEntity orderClosed = OrderEntity(
    idOrder: '',
    listItemEntity: ListItemEntity([]),
    address: '',
    nameRecipient: '',
    phone: '',
    typePayment: '',
    createdAt: '',
    updatedAt: '',
  );

  ItemCubit() : super(const ItemInitialState());

  void addItem({required ItemFlowEntity item}) {
    emit(const ItemLoadingState());
    listItensEntity.listItems.add(item);
    actualListItens = listItensEntity;
    emit(const ItemSuccessState());
  }

  void removeItem({required ItemFlowEntity item}) {
    emit(const ItemLoadingState());
    listItensEntity.listItems.remove(item);
    actualListItens = listItensEntity;
    emit(const ItemInitialState());
  }

  void editItem({required ItemFlowEntity item}) {
    emit(const ItemLoadingState());
    listItensEntity.listItems.remove(item);
    actualListItens.listItems.add(item);
    actualListItens = listItensEntity;
    emit(const ItemSuccessState());
  }

  void updateOrderEntity(OrderEntity order) {
    emit(const ItemLoadingState());
    orderClosed = order;
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
    double widthRounded = ((widthMeasure / 50).ceil() * 50);
    double heightRounded = ((heightMeasure / 50).ceil() * 50);
    debugPrint('Largura arredondada: $widthRounded');
    debugPrint('Altura arredondada: $heightRounded');
    double totalM2 = ((widthRounded * heightRounded) / 1000000);
    measureMeterBilling = totalM2;
    totalMetrosQuadrados = ((widthMeasure * heightMeasure) / 1000000); // Valor em metros quadrados

    //double valorArredondado = (totalMetrosQuadrados * 1000000).ceilToDouble() / 1000000;

    //int valorArredondadoMilimetros = (valorArredondado * 1000).toInt();
    //int valorArredondadoMultiplo50 = (valorArredondadoMilimetros / 50).ceil() * 50;
    //converteMeasureMeterBilling = (valorArredondadoMultiplo50.toDouble()).toStringAsFixed(2);
    //measureMeterBilling = double.parse(converteMeasureMeterBilling);
    debugPrint('Valor em metros quadrados: $totalM2');
    debugPrint('Medida Real em metros quadrados: $totalMetrosQuadrados');
    emit(const ItemCalculateState());
  }

  void roundMeasure() {
    // double measure = value / 1000000;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchDocumentsFirebase(String value) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return await firestore.collection('itens_premier').where('descriptionItem', isEqualTo: value).get().then((result) {
      return result;
    });
  }

  void calculateTotalValue() {
    emit(const ItemLoadingState());
    totalPriceValue = (price * quantity);
    emit(const ItemCalculateState());
  }
}
