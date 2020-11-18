import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';
import 'package:desafiofinxi/modules/search/internaldata/database/database.dart';
import 'package:desafiofinxi/modules/search/internaldata/interfaces/gif_crud_interface.dart';

class GifCrud implements IGifCrud{
  @override
  Future deleteGif(int id) async{
    final db = await DBProvidder.db.database;
    await db.delete('gif', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<GifModel>> getAllGifs(int id) async{
    final db = await DBProvidder.db.database;
    List<Map<dynamic, dynamic>> res = await db.query('gif');
    return res.isNotEmpty ? res.map((map) => GifModel.fromJson(map)).toList() : null;
  }

  @override
  Future<GifModel> getGif(int id) async{
    final db = await DBProvidder.db.database;
    List<Map<dynamic, dynamic>> res = await db.query('gif', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? GifModel.fromJson(res.first) : null;
  }

  @override
  Future<int> insertGif(GifModel gif) async{
    final db = await DBProvidder.db.database;
    var res = await db.insert('gif', gif.toMap());
    return res;
  }

  @override
  Future<int> updateGif(GifModel gif, int id) async{
    final db = await DBProvidder.db.database;
    return await db.update('gif', gif.toMap(), where: 'id = ?', whereArgs: [id]);
  }
}