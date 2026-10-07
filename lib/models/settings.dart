import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final String currency;
  final int year;
  final double personalPercentage;
  final double investmentPercentage;
  final double responsibilitiesPercentage;
  final String weekStartsOn; // 'Sunday' or 'Monday'

  const Settings({
    required this.currency,
    required this.year,
    required this.personalPercentage,
    required this.investmentPercentage,
    required this.responsibilitiesPercentage,
    required this.weekStartsOn,
  });

  Map<String, dynamic> toMap() => {
        'id': 1,
        'currency': currency,
        'year': year,
        'personalPercentage': personalPercentage,
        'investmentPercentage': investmentPercentage,
        'responsibilitiesPercentage': responsibilitiesPercentage,
        'weekStartsOn': weekStartsOn,
      };

  factory Settings.fromMap(Map<String, dynamic> map) => Settings(
        currency: map['currency'] ?? 'EGP',
        year: map['year'] ?? DateTime.now().year,
        personalPercentage: (map['personalPercentage'] as num?)?.toDouble() ?? (1 / 3),
        investmentPercentage: (map['investmentPercentage'] as num?)?.toDouble() ?? (1 / 3),
        responsibilitiesPercentage: (map['responsibilitiesPercentage'] as num?)?.toDouble() ?? (1 / 3),
        weekStartsOn: map['weekStartsOn'] ?? 'Sunday',
      );

  Settings copyWith({
    String? currency,
    int? year,
    double? personal,
    double? investment,
    double? responsibilities,
    String? weekStartsOn,
  }) {
    return Settings(
      currency: currency ?? this.currency,
      year: year ?? this.year,
      personalPercentage: personal ?? personalPercentage,
      investmentPercentage: investment ?? investmentPercentage,
      responsibilitiesPercentage: responsibilities ?? responsibilitiesPercentage,
      weekStartsOn: weekStartsOn ?? this.weekStartsOn,
    );
  }

  @override
  List<Object?> get props => [
        currency,
        year,
        personalPercentage,
        investmentPercentage,
        responsibilitiesPercentage,
        weekStartsOn
      ];
}
