part of 'cubit_comments.dart';

abstract class CommentState extends Equatable {
  const CommentState();
}

class CommentInitial extends CommentState {
  @override
  List<Object?> get props => [];
  
}

class CommentLoading extends CommentState {
  @override
  List<Object?> get props => [];
  
} 

class CommentLoaded extends CommentState {
  final List<TextCommentsEntity> comments;

  const CommentLoaded({required this.comments});

  @override
  List<Object?> get props => [comments];
  
}

class CommentFail extends CommentState {
  @override
  List<Object?> get props => [];
  
}