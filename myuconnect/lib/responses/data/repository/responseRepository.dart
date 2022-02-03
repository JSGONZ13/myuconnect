// ignore_for_file: file_names



import 'package:myuconnect/responses/data/models/response.dart';
import 'package:myuconnect/responses/data/models/response_model.dart';

abstract class ResponsesRepository {
  Stream<List<ResModel>> getResponses(String nameCollection);
  Future<void> addNewResponses(Responses responses, String idDocument);
  Future<void> deleteResponse(Responses responses, String idDocument, String? idRes);
}