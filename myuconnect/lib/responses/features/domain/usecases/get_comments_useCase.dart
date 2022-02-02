// ignore_for_file: file_names

import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';
import 'package:myuconnect/responses/features/domain/repositories/firebase_Repository.dart';

class GetCommentsUseCase {
  late final FireBaseRepository repository;

  

  Stream<List<TextCommentsEntity>> call (String refPost) {
    return repository.getAllComments(refPost);
  }
}