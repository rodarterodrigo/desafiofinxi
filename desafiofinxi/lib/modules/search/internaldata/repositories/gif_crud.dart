import 'package:desafiofinxi/modules/search/infra/models/gif_model.dart';
import 'package:desafiofinxi/modules/search/internaldata/database/database.dart';
import 'package:desafiofinxi/modules/search/internaldata/interfaces/gif_crud_interface.dart';

class GifCrud implements IGifCrud {
  @override
  Future<int> deleteGif(int id) async {
    final db = await DBProvidder.db.database;
    await db.delete('gif', where: 'id = ?', whereArgs: [id]);
    return id;
  }

  @override
  Future<List<GifModel>> getAllGifs() async {
    final db = await DBProvidder.db.database;
    List<Map<dynamic, dynamic>> res = await db.query('gif');
    return res.isNotEmpty
        ? res.map((map) => GifModel.fromDb(map)).toList()
        : [];
  }

  @override
  Future<GifModel> getGif(int id) async {
    final db = await DBProvidder.db.database;
    List<Map<dynamic, dynamic>> res =
        await db.query('gif', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? GifModel.fromDb(res.first) : null;
  }

  @override
  Future<int> insertGif(GifModel gif) async {
    final db = await DBProvidder.db.database;
    if (await getGifByGiphyId(gif.giphyId)) {
      return gif.id;
    } else {
      return await db.insert('gif', gif.toMap());
    }
  }

  @override
  Future<bool> getGifByGiphyId(String giphyId) async {
    final db = await DBProvidder.db.database;
    List<Map<dynamic, dynamic>> res =
        await db.query('gif', where: 'giphyId = ?', whereArgs: [giphyId]);
    if (res.isNotEmpty)
      return true;
    else
      return false;
  }

  @override
  Future<int> updateGif(GifModel gif) async {
    final db = await DBProvidder.db.database;
    await db.update('gif', gif.toMap(), where: 'id = ?', whereArgs: [gif.id]);
    return gif.id;
  }
}
