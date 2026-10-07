import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/models.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;
  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'moneysplit.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE settings (
        id INTEGER PRIMARY KEY,
        currency TEXT,
        year INTEGER,
        personalPercentage REAL,
        investmentPercentage REAL,
        responsibilitiesPercentage REAL,
        weekStartsOn TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        mainCategory TEXT,
        subCategory TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE planned_income (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        month INTEGER,
        year INTEGER,
        amount REAL
      )
    ''');
    await db.execute('''
      CREATE TABLE actual_income (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        month INTEGER,
        year INTEGER,
        date TEXT,
        source TEXT,
        amount REAL,
        notes TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        dayOfWeek TEXT,
        description TEXT,
        mainCategory TEXT,
        subCategory TEXT,
        amount REAL,
        notes TEXT
      )
    ''');
    await _seed(db);
  }

  Future<void> _seed(Database db) async {
    // Settings
    await db.insert('settings', {
      'id': 1,
      'currency': 'EGP',
      'year': 2026,
      'personalPercentage': 1 / 3,
      'investmentPercentage': 1 / 3,
      'responsibilitiesPercentage': 1 / 3,
      'weekStartsOn': 'Sunday',
    });

    // Categories
    final cats = [
      ['Personal Payment', 'Food'],
      ['Personal Payment', 'Entertainment'],
      ['Personal Payment', 'Shopping'],
      ['Personal Payment', 'Transportation'],
      ['Personal Payment', 'Subscriptions'],
      ['Personal Payment', 'Personal Development'],
      ['Personal Payment', 'Other'],
      ['Investment Payment', 'Stocks'],
      ['Investment Payment', 'Funds'],
      ['Investment Payment', 'Gold'],
      ['Investment Payment', 'Business'],
      ['Investment Payment', 'Education'],
      ['Investment Payment', 'Other'],
      ['Responsibilities Payment', 'Rent'],
      ['Responsibilities Payment', 'Bills'],
      ['Responsibilities Payment', 'Family'],
      ['Responsibilities Payment', 'Debt'],
      ['Responsibilities Payment', 'Utilities'],
      ['Responsibilities Payment', 'Insurance'],
      ['Responsibilities Payment', 'Other'],
    ];
    for (final c in cats) {
      await db.insert('categories', {'mainCategory': c[0], 'subCategory': c[1]});
    }

    // Planned incomes
    final months = [
      1,2,3,4,5,6,7,8,9,10,11,12
    ];
    for (int m in months) {
      await db.insert('planned_income', {
        'month': m,
        'year': 2026,
        'amount': m == 10 ? 19000.0 : 0.0,
      });
    }

    // Actual income
    await db.insert('actual_income', {
      'month': 10,
      'year': 2026,
      'date': '',
      'source': '',
      'amount': 19000.0,
      'notes': '',
    });

    // Transactions Oct
    await db.insert('transactions', {
      'date': '2026-10-05',
      'dayOfWeek': 'Monday',
      'description': '',
      'mainCategory': 'Personal Payment',
      'subCategory': 'Food, Transportation',
      'amount': 200.0,
      'notes': '',
    });
    await db.insert('transactions', {
      'date': '2026-10-06',
      'dayOfWeek': 'Tuesday',
      'description': '2000 EGB (Cloths)',
      'mainCategory': 'Personal Payment',
      'subCategory': 'Food, Transportation, Shopping',
      'amount': 2200.0,
      'notes': '',
    });
    await db.insert('transactions', {
      'date': '2026-10-07',
      'dayOfWeek': 'Wednesday',
      'description': '',
      'mainCategory': 'Personal Payment',
      'subCategory': 'Food, Transportation',
      'amount': 100.0,
      'notes': '',
    });
  }
}
