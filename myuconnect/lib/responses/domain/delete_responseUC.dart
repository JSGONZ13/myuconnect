// ignore_for_file: file_names

import 'package:myuconnect/responses/data/models/response_model.dart';
import 'package:myuconnect/responses/data/repository/responseRepository.dart';

class DeleteResponseUC {
  final ResponsesRepository _responsesRepository;

  DeleteResponseUC(this._responsesRepository);

  Future<void> call (Responses responses, String idDocument, String? idRes) async {
    return _responsesRepository.deleteResponse(responses, idDocument, idRes);
  }
}