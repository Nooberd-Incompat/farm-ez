import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:farm_ez/models/farmer.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  print(dbPath);
  final db = await sql.openDatabase(
    path.join(dbPath, 'farmers.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_farmers(id TEXT PRIMARY KEY, title TEXT, phone TEXT, image TEXT)');
    },
    version: 1,
  );
  return db;
}

class UserFarmersNotifier extends StateNotifier<List<Farmer>> {
  UserFarmersNotifier() : super(const []);

  // Load farmers from the database
  Future<void> loadFarmers() async {
    final db = await _getDatabase();
    final data = await db.query('user_farmers');
    final farmers = data
        .map(
          (row) => Farmer(
            id: row['id'] as String,
            title: row['title'] as String,
            phone: row['phone'] as String,
            image: File(row['image'] as String),
          ),
        )
        .toList();

    state = farmers;
  }

  // Add a new farmer to the database and update the state
  void addFarmer(String title, File image, String phone) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');
    final newFarmer = Farmer(title: title, phone: phone, image: copiedImage);

    final db = await _getDatabase();
    final id = await db.insert(
      'user_farmers',
      {
        'title': newFarmer.title,
        'phone': newFarmer.phone,
        'image': copiedImage.path,
      },
    );

    // Update state with the new farmer including the generated ID
    state = [...state, newFarmer];
  }

  // Delete a farmer from the database and update the state
  void deleteFarmer(String id) async {
    final db = await _getDatabase();
    await db.delete(
      'user_farmers',
      where: 'id = ?',
      whereArgs: [id],
    );

    // Update state by removing the deleted farmer
    state = state.where((farmer) => farmer.id != id).toList();
  }
}

final userFarmerProvider =
    StateNotifierProvider<UserFarmersNotifier, List<Farmer>>(
  (ref) => UserFarmersNotifier(),
);
