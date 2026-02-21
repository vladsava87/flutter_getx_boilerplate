import 'package:flutter/widgets.dart';

@immutable
class ExampleEntity {
  final int? id;
  final String name;
  final DateTime createdAt;

  const ExampleEntity({this.id, required this.name, required this.createdAt});

  ExampleEntity copyWith({
    ValueGetter<int?>? id,
    String? name,
    DateTime? createdAt,
  }) {
    return ExampleEntity(
      id: id != null ? id() : this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ExampleEntity.fromMap(Map<String, dynamic> map) {
    return ExampleEntity(
      id: map['id'],
      name: map['name'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}
