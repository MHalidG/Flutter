import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/kahraman.dart';

class DbHelper{

  //String dbPath= join(getDatabasesPath(),"heroes.db") ;
  //Database _db=openDatabase(dbPath,version: 1,onCreate: createDb);
  Database? _db;


  Future<Database?> get db async{
     _db ??= await initializeDb();
     return _db;
   }


  Future<Database> initializeDb() async {
     String dbPath= join(await getDatabasesPath(),"heroes.db") ;
     var heroesDb=openDatabase(dbPath,version: 1,onCreate: createDb);
     return heroesDb;
  }


  void createDb(Database db,int version) async{
     await db.execute("Create table alfalar(id integer primary key, name text, yetenekler text, guc integer)");
  }


  Future<List<Kahraman>> getAlfas() async{
     Database? db=await this.db;

     var result=await db?.query("alfalar");

     return List.generate(result!.length, (i){
       return Kahraman.fromObject(result[i]);
     });
  }

  Future<int?> insert(Kahraman kahraman)async {
     Database? db= await this.db;

     var result=await db?.insert("alfalar", kahraman.toMap());
     return result;
   }


   Future<int?> delete(int id)async {
     Database? db= await this.db;

     var result=await db?.rawDelete("delete from alfalar where id= $id");
     return result;
   }

   Future<int?> update(Kahraman kahraman)async {
     Database? db= await this.db;

     var result=await db?.update("alfalar",kahraman.toMap(),where:"id=?",whereArgs:[kahraman.id]);

     return result;
   }



}