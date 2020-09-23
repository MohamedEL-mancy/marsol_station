import 'package:marsol/models/orders_class.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  Database _db;

  Future<Database> createDataBase() async {
    if (_db != null) {
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'school.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      db.execute(
          "create table orders(id integer , title varchar(50), subTitle varchar(255))");
    });
    return _db;
  }

  Future<int> createOrders(OrdersClass orders) async {
    Database _db = await createDataBase();
    return _db.insert('orders', orders.toMap());
  }

  Future<List> getAllOrders() async {
    Database _db = await createDataBase();
    return _db.query('orders');
  }

  Future<int> deleteOrder(int id) async {
    Database _db = await createDataBase();
    return _db.delete('orders', where: 'id=?', whereArgs: [id]);
  }
}
