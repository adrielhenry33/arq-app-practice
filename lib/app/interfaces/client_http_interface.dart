abstract  class ClientHttpInterface {
  void addHeader(String header );
  Future<Map<String, dynamic>> get(String url) ;

}