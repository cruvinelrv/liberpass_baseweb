// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/list_item_entity.dart';
import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/order_entity.dart';
import 'package:liberpass_baseweb/app/modules/shared/extensions/double_extensions.dart';
import 'package:liberpass_baseweb/app/modules/shared/extensions/extensions.dart';
import '../../../../../central_base/sub_modules/scm/domain/entities/item_flow_entity.dart';
import 'states/states.dart';

class ItemCubit extends Cubit<ItemStates> {
  ListItemEntity listItensEntity = ListItemEntity([]);
  late ListItemEntity actualListItens = ListItemEntity([]);
  String description = '';
  double price = 0;
  String unitMeasure = '';
  double quantity = 0;
  double totalPriceValue = 0;
  double totalPriceOrder = 0;
  double widthMeasure = 0;
  double heightMeasure = 0;
  double totalMetrosQuadrados = 0;
  double realLinearMeterPerimeter = 0;
  double measureMeterBilling = 0;
  String converteMeasureMeterBilling = '';
  String currencyBrazilian = '';
  double priceAmericanDouble = 0.0;
  double quantityAmericanDouble = 0.0;
  double totalPriceAmericanDouble = 0.0;
  String totalPriceBrazilianCurrency = '';
  double linearMeterPerimeterBilling = 0.0;
  double totalPriceMetersWithQuantity = 0.0;

  OrderEntity orderClosed = OrderEntity(
    idOrder: '',
    listItemEntity: ListItemEntity([]),
    address: '',
    nameRecipient: '',
    phone: '',
    typePayment: '',
    createdAt: '',
    updatedAt: '',
    totalOrder: 0,
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
    totalMetrosQuadrados = ((widthMeasure * heightMeasure) / 1000000);
    debugPrint('Medida para faturamento em metros quadrados: $totalM2');
    debugPrint('Medida Real em metros quadrados: $totalMetrosQuadrados');
    unitMeasure = 'M2';
    emit(const ItemCalculateState());
  }

  void calculatePerimeter() {
    emit(const ItemLoadingState());
    emit(const ItemLoadingState());
    realLinearMeterPerimeter = ((widthMeasure + heightMeasure) * 2) / 1000;
    double widthRounded = ((widthMeasure / 50).ceil() * 50);
    double heightRounded = ((heightMeasure / 50).ceil() * 50);
    unitMeasure = 'M';
    linearMeterPerimeterBilling = ((widthRounded + heightRounded) * 2) / 1000;
    emit(const ItemCalculateState());
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
    emit(const ItemSuccessState());
  }

  void calculateTotalOrder(ListItemEntity listItens) {
    totalPriceOrder = 0;
    emit(const ItemLoadingState());
    for (var item in listItens.listItems) {
      totalPriceOrder += double.parse(item.totalItem.toString());
      debugPrint('Total Order: $totalPriceOrder');
    }
    emit(const ItemSuccessState());
  }

  void applyCurrencyBrazilian(double value) {
    //currencyBrazilian = value.currency(locale: 'pt_BR');
    currencyBrazilian = value.toCurrencyStringWithoutSymbol();
    totalPriceBrazilianCurrency = currencyBrazilian.replaceAll('.', '').replaceAll('.', ',');
  }

  void currencyBrazilianForAmericanDouble(String? price) {
    //currencyAmericanDouble = double.parse(currencyBrazilian.replaceAll('.', '').replaceAll(',', '.'));
  }

  void calculateTotalPriceAmericanDouble({required String quantity, required String price}) {
    debugPrint('Quantidade: $quantity');
    debugPrint('Preço: $price');
    quantityAmericanDouble = double.parse(quantity);
    priceAmericanDouble = double.parse(price.replaceAll('.', '').replaceAll(',', '.'));
    totalPriceAmericanDouble = (priceAmericanDouble * quantityAmericanDouble);
    totalPriceBrazilianCurrency =
        NumberFormat.decimalPatternDigits(locale: 'pt_BR', decimalDigits: 2).format(totalPriceAmericanDouble);
    debugPrint('Total Price American Double: $totalPriceAmericanDouble');
    debugPrint('Total Price Brazilian Currency: $totalPriceBrazilianCurrency');
    //applyCurrencyBrazilian(totalPriceAmericanDouble);
    emit(const ItemTotalCalcState());
  }

  void calculatePriceAndMetersAmericanDouble(
      {required String quantity, required String price, required String measureBilling}) {
    debugPrint('Quantidade: $quantity');
    debugPrint('Preço: $price');
    quantityAmericanDouble = double.parse(quantity);
    priceAmericanDouble = double.parse(price.replaceAll('.', '').replaceAll(',', '.'));
    measureMeterBilling = double.parse(measureBilling);
    totalPriceAmericanDouble = (priceAmericanDouble * quantityAmericanDouble) * measureMeterBilling;
    totalPriceBrazilianCurrency =
        NumberFormat.decimalPatternDigits(locale: 'pt_BR', decimalDigits: 2).format(totalPriceAmericanDouble);
    debugPrint('Total Price American Double: $totalPriceAmericanDouble');
    debugPrint('Total Price Brazilian Currency: $totalPriceBrazilianCurrency');
    //applyCurrencyBrazilian(totalPriceAmericanDouble);
    emit(const ItemTotalCalcState());
  }

  void backToInitialState() {
    emit(const ItemInitialState());
  }

  (double, double) calculateLinearSquareMeter() {
    double widthRounded = ((widthMeasure / 50).ceil() * 50);
    double heightRounded = ((heightMeasure / 50).ceil() * 50);

    double realMeasure = ((widthMeasure * heightMeasure) / 1000000);
    double billingMeasure = ((widthRounded * heightRounded) / 1000000);
    return (realMeasure, billingMeasure);
  }
}
