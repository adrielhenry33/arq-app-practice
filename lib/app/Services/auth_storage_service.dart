import 'package:arq_app/app/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStorageService implements LocalStorageInterface {
  @override
  Future delete(String key) async {
    if(key == '') return;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  @override
  Future get(String key) async{
    if(key == '') return;
    final prefs = await SharedPreferences.getInstance();
    return  prefs.get(key);
  }

  @override
  Future put(String key, value) async{
    if(value == null) return;
    if(key == '') return;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  
}