// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:myuconnect/responses/data/models/response_model.dart';
import 'package:myuconnect/responses/domain/add_new_responseUC.dart';
import 'package:myuconnect/responses/domain/delete_responseUC.dart';
import 'package:myuconnect/responses/domain/get_responses_UC.dart';

class ResponsesProvider with ChangeNotifier {


  final GetResponsesUC _getResponsesUC;
  final AddNewResponseUC _addNewResponseUC;
  final DeleteResponseUC _deleteResponseUC;

  ResponsesProvider(this._getResponsesUC, this._addNewResponseUC, this._deleteResponseUC) : assert (_getResponsesUC != null && _addNewResponseUC != null);

  List<Responses> _responses = [];

  List<Responses> get responses => _responses;


  void sendResponses (Responses responses, String idDocument) async {
    try {
      await  _addNewResponseUC(responses, idDocument);
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }
  
  void getResponses (String nameCollection) async {
    try {
     //_getResponsesUC(nameCollection);
     _getResponsesUC(nameCollection);
     print(_responses);
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  void deleteResponse (Responses responses, String idDocument, String? idRes) async {
    try {
      await _deleteResponseUC(responses, idDocument, idRes);
      print("deleeeee");
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }
}