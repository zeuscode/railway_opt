import 'package:railway_opt/databases/mantras_database.dart';
import 'package:railway_opt/model/mantra_model.dart';

class MantarRepository {

  final _db = MantraDatabase();

  final MantraDatabase _mantraDatabase;

   MantarRepository(this._mantraDatabase);

  Future<List<MantraModel>> getMantras() async {
    return _mantraDatabase.getMantras();
  }

  Future<MantraModel> addMantar(MantraModel mantraModel) {
    return _mantraDatabase.insert(mantraModel);
  }
  Future<bool> isExistCode(String code)  {
    return _mantraDatabase.find(code);
  }

}