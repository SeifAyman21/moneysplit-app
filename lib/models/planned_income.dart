import 'package:equatable/equatable.dart';

class PlannedIncome extends Equatable {
  final int? id;
  final int month; // 1-12
  final int year;
  final double amount;

  const PlannedIncome({this.id, required this.month, required this.year, required this.amount});

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'month': month,
        'year': year,
        'amount': amount,
      };

  factory PlannedIncome.fromMap(Map<String, dynamic> map) => PlannedIncome(
        id: map['id'],
        month: map['month'] ?? 1,
        year: map['year'] ?? DateTime.now().year,
        amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
      );

  @override
  List<Object?> get props => [id, month, year, amount];
}
