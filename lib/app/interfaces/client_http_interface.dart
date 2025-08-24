abstract  class ClientHttpInterface {
  void addHeader(String header );
  Future<List<dynamic>> get(String url) ;

}