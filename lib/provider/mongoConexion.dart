import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;
class DBConnection {

  static DBConnection _instance = DBConnection();

  final String _getConnectionString = "mongodb+srv://kaypiAdmin:kaypiAdmin123@clusterkaypi.1nlh5.mongodb.net/test?authSource=admin&replicaSet=atlas-cnvfz1-shard-0&readPreference=primary&appname=MongoDB%20Compass&ssl=true";

  late Db _db;

  static getInstance(){
    if(_instance == null) {
      _instance = DBConnection();
    }
    return _instance;
  }

  Future<Db> getConnection() async{
    if (_db == null){
      try {
        _db = Db.create(_getConnectionString) as Db;
        await _db.open();
      } catch(e){
        print(e);
      }
    }
    return _db;
  }

  closeConnection() {
    _db.close();
  }
}