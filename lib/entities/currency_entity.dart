class CurrencyEntity {
  String id;
  String name;
  String minSize;

  CurrencyEntity({
    required this.id,
    required this.name,
    required this.minSize,
  });

  factory CurrencyEntity.fromJson(dynamic json) {
    return CurrencyEntity(
        id: json['id'], name: json['name'], minSize: json['min_size']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['min_size'] = minSize;
    return map;
  }
}
