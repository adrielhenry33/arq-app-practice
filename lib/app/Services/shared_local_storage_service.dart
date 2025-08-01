import 'package:arq_app/app/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorageService  implements LocalStorageInterface{
  @override
  Future delete(String key) async{
    var shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future put(String key, value)  async{
    var shared = await SharedPreferences.getInstance();
    shared.setString(key, value);
  }
   
}