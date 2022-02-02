// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';
import 'package:myuconnect/responses/features/domain/repositories/firebase_Repository.dart';

class SendCommentsUseCase {
   final FireBaseRepository repository;

  SendCommentsUseCase(this.repository);


  

  Future<void> call (TextCommentsEntity textCommentsEntity, String refPost) async {
    return await repository.sendComments(textCommentsEntity, refPost);
  }

}