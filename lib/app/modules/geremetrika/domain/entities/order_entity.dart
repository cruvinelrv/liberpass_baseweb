import 'list_item_entity.dart';

class OrderEntity {
  final String idOrder;
  final String nameRecipient;
  final String phone;
  final String address;
  final String typePayment;
  final String createdAt;
  final String updatedAt;
  final ListItemEntity listItemEntity;

  const OrderEntity({
    required this.idOrder,
    required this.listItemEntity,
    required this.nameRecipient,
    required this.phone,
    required this.address,
    required this.typePayment,
    required this.createdAt,
    required this.updatedAt,
  });
}
