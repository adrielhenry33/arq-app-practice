import 'dart:convert';

import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:arq_app/app/interfaces/store_repository_interface.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:http/http.dart' as http;

class StoreRepositoryImplementation  implements StoreRepositoryInterface {
  
  //injeção de dependencia manual 
  final ClientHttpInterface  client;

  StoreRepositoryImplementation(this.client);

  @override
  Future<List<StoreModel>> getStore() async {
    final response = await http.get (Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => StoreModel.fromJson(json)).toList();
    } else{
      throw Exception('Falha ao carregar os dados');
    }
  }
}