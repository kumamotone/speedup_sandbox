class Currency {
  String id;
  String name;
  String minSize;

  Currency({
    required this.id,
    required this.name,
    required this.minSize,
  });

  factory Currency.fromJson(dynamic json) {
    return Currency(
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
