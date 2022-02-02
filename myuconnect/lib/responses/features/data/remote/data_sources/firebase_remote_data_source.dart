import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';

abstract class FireBaseRemoteDataSource {
  Future <void> sendComments (
    TextCommentsEntity textCommentsEntity, String refPost
  );

  Stream<List<TextCommentsEntity>> getComments (String refPost);
}