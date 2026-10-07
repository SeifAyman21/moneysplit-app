import 'package:equatable/equatable.dart';

class ActualIncome extends Equatable {
  final int? id;
  final int month;
  final int year;
  final String date; // ISO string or empty
  final String source;
  final double amount;
  final String notes;

  const ActualIncome({
    this.id,
    required this.month,
    required this.year,
    required this.date,
    required this.source,
    required this.amount,
    required this.notes,
  });

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'month': month,
        'year': year,
        'date': date,
        'source': source,
        'amount': amount,
        'notes': notes,
      };

  factory ActualIncome.fromMap(Map<String, dynamic> map) => ActualIncome(
        id: map['id'],
        month: map['month'] ?? 1,
        year: map['year'] ?? DateTime.now().year,
        date: map['date'] ?? '',
        source: map['source'] ?? '',
        amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
        notes: map['notes'] ?? '',
      );

  @override
  List<Object?> get props => [id, month, year, date, source, amount, notes];
}
