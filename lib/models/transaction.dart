import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int? id;
  final String date; // ISO date string yyyy-MM-dd
  final String dayOfWeek;
  final String description;
  final String mainCategory;
  final String subCategory;
  final double amount;
  final String notes;

  const Transaction({
    this.id,
    required this.date,
    required this.dayOfWeek,
    required this.description,
    required this.mainCategory,
    required this.subCategory,
    required this.amount,
    required this.notes,
  });

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'date': date,
        'dayOfWeek': dayOfWeek,
        'description': description,
        'mainCategory': mainCategory,
        'subCategory': subCategory,
        'amount': amount,
        'notes': notes,
      };

  factory Transaction.fromMap(Map<String, dynamic> map) => Transaction(
        id: map['id'],
        date: map['date'] ?? '',
        dayOfWeek: map['dayOfWeek'] ?? '',
        description: map['description'] ?? '',
        mainCategory: map['mainCategory'] ?? '',
        subCategory: map['subCategory'] ?? '',
        amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
        notes: map['notes'] ?? '',
      );

  Transaction copyWith({
    int? id,
    String? date,
    String? dayOfWeek,
    String? description,
    String? mainCategory,
    String? subCategory,
    double? amount,
    String? notes,
  }) {
    return Transaction(
      id: id ?? this.id,
      date: date ?? this.date,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      description: description ?? this.description,
      mainCategory: mainCategory ?? this.mainCategory,
      subCategory: subCategory ?? this.subCategory,
      amount: amount ?? this.amount,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
        id,
        date,
        dayOfWeek,
        description,
        mainCategory,
        subCategory,
        amount,
        notes
      ];
}
