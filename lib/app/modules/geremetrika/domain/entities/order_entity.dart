import 'list_item_entity.dart';

class OrderEntity {
  final String id;
  final String name;
  final String phone;
  final String address;
  final String typePayment;
  final String createdAt;
  final String updatedAt;
  final ListItemEntity listItemEntity;

  const OrderEntity({
    required this.id,
    required this.listItemEntity,
    required this.name,
    required this.phone,
    required this.address,
    required this.typePayment,
    required this.createdAt,
    required this.updatedAt,
  });
}
