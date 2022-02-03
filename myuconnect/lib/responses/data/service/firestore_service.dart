import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myuconnect/Models/post.dart';
import 'package:myuconnect/responses/data/models/response.dart';
import 'package:myuconnect/responses/data/models/response_model.dart';


class FirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;


  Stream<List<ResModel>> getResponses(String nameCollection) {
    final resCollection = db.collection(nameCollection);
    return resCollection.snapshots().map((event) {
      return event.docs.map((e) => ResModel.fromSnapshot(e)).toList();

    });
  }

  Future<void> addNewResponse(Responses responses, String idDocument) async {

    final postColl = db.collection("posts").doc(idDocument).collection("responses");

    final idRes = postColl.doc().id;
    postColl.doc(idRes).get().then((res) {
      final newRes = Responses(
        id: idRes,
        namePost: responses.namePost, 
        content: responses.content, 
        date: DateTime.now().toString(), 
        nickName: responses.nickName).toMap();
        if (!res.exists) {
          postColl.doc(idRes).set(newRes);
        }
        return;
    });
    
  }

  Future<void> deleteResponse(Responses responses, String idDocument, String? idRes) async {
    final resRef = db.collection("posts").doc(idDocument).collection("responses").doc(idRes);
    resRef.get().then((responses) {
      if (responses.exists) {
        resRef.delete().whenComplete(() => print("elemento eliminado"));
      }
      return;
    });
  }
}