import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String mainCategory;
  final String subCategory;

  const Category({this.id, required this.mainCategory, required this.subCategory});

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'mainCategory': mainCategory,
        'subCategory': subCategory,
      };

  factory Category.fromMap(Map<String, dynamic> map) => Category(
        id: map['id'],
        mainCategory: map['mainCategory'] ?? '',
        subCategory: map['subCategory'] ?? '',
      );

  @override
  List<Object?> get props => [id, mainCategory, subCategory];
}
