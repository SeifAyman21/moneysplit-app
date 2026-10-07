import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/db/database_helper.dart';
import '../models/models.dart';

final dbProvider = Provider<DatabaseHelper>((ref) => DatabaseHelper.instance);

final settingsProvider = FutureProvider<Settings>((ref) async {
  final db = await ref.read(dbProvider).database;
  final maps = await db.query('settings', where: 'id = ?', whereArgs: [1]);
  if (maps.isEmpty) {
    return const Settings(
      currency: 'EGP',
      year: 2026,
      personalPercentage: 1 / 3,
      investmentPercentage: 1 / 3,
      responsibilitiesPercentage: 1 / 3,
      weekStartsOn: 'Sunday',
    );
  }
  return Settings.fromMap(maps.first);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/db/database_helper.dart';
import '../models/models.dart';

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final db = await ref.read(dbProvider).database;
  final maps = await db.query('categories', orderBy: 'id');
  return maps.map((e) => Category.fromMap(e)).toList();
});

final plannedIncomesProvider = FutureProvider.family<List<PlannedIncome>, int>((ref, year) async {
  final db = await ref.read(dbProvider).database;
  final maps = await db.query('planned_income', where: 'year = ?', whereArgs: [year], orderBy: 'month');
  return maps.map((e) => PlannedIncome.fromMap(e)).toList();
});

final actualIncomesProvider = FutureProvider.family<List<ActualIncome>, (int year, int month)>((ref, params) async {
  final db = await ref.read(dbProvider).database;
  final maps = await db.query('actual_income',
      where: 'year = ? AND month = ?', whereArgs: [params., params.], orderBy: 'id');
  return maps.map((e) => ActualIncome.fromMap(e)).toList();
});

final transactionsProvider = FutureProvider.family<List<Transaction>, (int year, int month)>((ref, params) async {
  final db = await ref.read(dbProvider).database;
  // filter by month from date string yyyy-MM-dd
  final maps = await db.query('transactions', orderBy: 'date');
  final list = maps.map((e) => Transaction.fromMap(e)).toList();
  return list.where((t) {
    try {
      final parts = t.date.split('-');
      if (parts.length < 2) return false;
      final y = int.tryParse(parts[0]);
      final m = int.tryParse(parts[1]);
      return y == params. && m == params.;
    } catch (_) {
      return false;
    }
  }).toList();
});
