// ignore_for_file: file_names

import 'package:myuconnect/responses/data/models/response_model.dart';
import 'package:myuconnect/responses/data/repository/responseRepository.dart';

class AddNewResponseUC {
  final ResponsesRepository _responsesRepository;

  AddNewResponseUC(this._responsesRepository) : assert (_responsesRepository != null);

  Future<void> call (Responses responses, String idDocument) {
    return _responsesRepository.addNewResponses(responses, idDocument);
  }
}