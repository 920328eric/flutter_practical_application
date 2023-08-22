
import 'package:sqflite/sqflite.dart';

//設定資料庫一些資料
class SqliteHelper{
  final SqlFileName = 'mydb.sql'; //// 常數，不可變
  final table = 'post';
  late Database db;
  open() async{
    String path = "${await getDatabasesPath()}/$SqlFileName";//因為是未來的資料，所以要用await，搭配async
    db =await openDatabase(
        path,
        version: 1,//目前database table 版本
        onCreate: (db,ver)async{//database產生，就會進到這個oncreate function來
          await db.execute('''
            CREATE TABLE post(
              id INTEGER PRIMARY KEY,
              userId INTEGER,
              title TEXT,
              body TEXT
            );
          ''');//''' ''' sql語法且讓字串很多行
        }
      );
  }
  insert(Map<String,dynamic> data)async{
      await db.insert(table, data);
    }
  queryall()async{
    return await db.query(table,columns: null);//null預設會叫回所有的欄位
  }
  delere(int id)async{
    return await db.delete(table,where: 'id=$id');
  }
}
