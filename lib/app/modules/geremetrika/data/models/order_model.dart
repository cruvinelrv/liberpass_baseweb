import 'package:liberpass_baseweb/app/modules/geremetrika/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.address,
    required super.typePayment,
    required super.createdAt,
    required super.updatedAt,
    required super.listItemEntity,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      listItemEntity: json['listItemEntity'],
      name: json['name'],
      phone: json['phone'],
      address: json['comment'],
      typePayment: json['typePayment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'listItemEntity': listItemEntity,
        'name': name,
        'phone': phone,
        'address': address,
        'typePayment': typePayment,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
