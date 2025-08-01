import 'package:arq_app/app/Repository/apiadvisor_model.dart';
import 'package:arq_app/app/Repository/apiadvisor_respository_interface.dart';
import 'package:arq_app/app/Services/client_http_service.dart';
import 'package:arq_app/app/interfaces/client_http_interface.dart';

class ApiadvisorRepository implements ApiadvisorRespositoryInterface{
  
  final ClientHttpInterface client;

  ApiadvisorRepository({required this.client});

  @override
  Future<ApiadvisorModel> get() async{
    
  }
  
}