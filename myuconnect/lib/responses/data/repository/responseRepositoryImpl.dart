// ignore_for_file: file_names

import 'package:myuconnect/responses/data/models/response.dart';
import 'package:myuconnect/responses/data/models/response_model.dart';
import 'package:myuconnect/responses/data/repository/responseRepository.dart';
import 'package:myuconnect/responses/data/service/firestore_service.dart';

class ResponseRepositoryImpl extends ResponsesRepository {

  final FirebaseService _firebaseService;

  ResponseRepositoryImpl(this._firebaseService) : assert (_firebaseService != null);

  @override
  Future<void> addNewResponses(Responses responses, String idDocument) async {
    _firebaseService.addNewResponse(responses, idDocument);
  }

  @override
  Stream<List<ResModel>> getResponses(String nameCollection) => 
  _firebaseService.getResponses(nameCollection);

  @override
  Future<void> deleteResponse(Responses responses, String idDocument, String? idRes) async {
    _firebaseService.deleteResponse(responses, idDocument, idRes);
  }


}