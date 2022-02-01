class Post {
  String _id = "", _titulo = "", _body = "", _nicknameUsuario = "", _date = "";

  Post(this._id, this._titulo, this._body, this._nicknameUsuario, this._date);

  Post.map(dynamic object) {
    _titulo = object['titulo'];
    _body = object['body'];
    _nicknameUsuario = object['nicknameUsuario'];
  }

  String get id => _id;
  String get titulo => _titulo;
  String get body => _body;
  String get nicknameUsuario => _nicknameUsuario;
  String get date => _date;
}
