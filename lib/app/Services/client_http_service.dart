import 'dart:convert';

import 'package:arq_app/app/interfaces/client_http_interface.dart';
import 'package:http/http.dart' as http;

class ClientHttpServiceImplementation implements ClientHttpInterface {
  final http.Client httpClient = http.Client();

  @override
  void addHeader(String token) {}
  @override
  Future<List<dynamic>> get(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        return body;
      } else{
        throw Exception('Falha na requisição');
      }
    } catch (e) {
      throw Exception('Ocorreu um erro ao fazer a requisição ');
    }
  }
}
