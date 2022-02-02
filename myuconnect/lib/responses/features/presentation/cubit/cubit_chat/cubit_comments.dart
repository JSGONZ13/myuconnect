

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';
import 'package:myuconnect/responses/features/domain/usecases/get_comments_useCase.dart';
import 'package:myuconnect/responses/features/domain/usecases/send_comments_useCase.dart';

part 'cubit_state.dart';

class CommentsCubit extends Cubit<CommentState> {
  final SendCommentsUseCase sendCommentsUseCase;
  final GetCommentsUseCase getCommentsUseCase;
  CommentsCubit({
    required this.getCommentsUseCase, required this.sendCommentsUseCase
  }) : super(CommentInitial()); 
  
  Future<void> getComments ({required String refPost}) async {
    emit(CommentLoading());
    final streamResponse = getCommentsUseCase.call(refPost);
    streamResponse.listen((comments) {
      emit(CommentLoaded(comments: comments));
     });
  }
  

  Future<void> sendComments ({required TextCommentsEntity textCommentsEntity, required String refPost}) async {
    try {
      await sendCommentsUseCase.call(textCommentsEntity, refPost);
    } on SocketException catch(_) {
      emit(CommentFail());
    } catch (_) {
      emit(CommentFail());
    }
  }
}