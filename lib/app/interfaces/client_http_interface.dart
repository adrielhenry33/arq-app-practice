
abstract class ClientHttpInterface {
  void addHeader(String header);
  Future<dynamic> get(String url);
}
