// ignore_for_file: unnecessary_null_comparison, file_names

import 'package:myuconnect/responses/data/models/response.dart';
import 'package:myuconnect/responses/data/models/response_model.dart';
import 'package:myuconnect/responses/data/repository/responseRepository.dart';

class GetResponsesUC {
  final ResponsesRepository _responsesRepository;

  GetResponsesUC(this._responsesRepository) : assert (_responsesRepository != null);
  
  Stream<List<ResModel>> call (String nameCollection)  {
    return  _responsesRepository.getResponses(nameCollection);
    //return resp;
  }
}