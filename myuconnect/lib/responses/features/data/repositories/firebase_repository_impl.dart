
import 'package:myuconnect/responses/features/data/remote/data_sources/firebase_remote_data_source.dart';
import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';
import 'package:myuconnect/responses/features/domain/repositories/firebase_repository.dart';

class FireBaseRepositoryImpl implements FireBaseRepository {
  final FireBaseRemoteDataSource remoteDataSource;

  FireBaseRepositoryImpl({
     required this.remoteDataSource 
  });

  @override
  Stream<List<TextCommentsEntity>> getAllComments(String refPost) {
    return remoteDataSource.getComments(refPost);
  }

  @override
  Future<void> sendComments(TextCommentsEntity textCommentEntity, String refPost) async {
    return await remoteDataSource.sendComments(textCommentEntity, refPost);
  }
  
}