import 'package:equatable/equatable.dart';

class Res extends Equatable {
  final String? contenido;

  Res({this.contenido});

  @override
  // TODO: implement props
  List<Object?> get props => [contenido];
}