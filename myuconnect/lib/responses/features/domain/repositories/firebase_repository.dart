// ignore_for_file: file_names

import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';

abstract class FireBaseRepository {

  Stream<List<TextCommentsEntity>> getAllComments(String refPost);
  Future<void> sendComments (TextCommentsEntity textCommentEntity, String refPost);

}