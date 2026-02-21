class ExampleModel {
  final int? id;
  final String name;
  final DateTime createdAt;

  ExampleModel({this.id, required this.name, required this.createdAt});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'createdAt': createdAt.toIso8601String()};
  }

  factory ExampleModel.fromMap(Map<String, dynamic> map) {
    return ExampleModel(
      id: map['id'],
      name: map['name'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  ExampleModel copyWith({int? id, String? name, DateTime? createdAt}) {
    return ExampleModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
