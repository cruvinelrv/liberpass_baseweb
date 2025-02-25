import 'dart:convert';

import '../../../central_base/sub_modules/scm/domain/entities/item_flow_entity.dart';

class ListItemEntity {
  final List<ItemFlowEntity> listItems;
  const ListItemEntity(this.listItems);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'listItems': listItems.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ListItemEntity.fromMap(Map<String, dynamic> map) {
    return ListItemEntity(
      List<ItemFlowEntity>.from(map['listItems']?.map((x) => ItemFlowEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListItemEntity.fromJson(String source) => ListItemEntity.fromMap(json.decode(source));
}
