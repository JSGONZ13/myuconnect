// ignore_for_file: prefer_initializing_formals
class User {
  String? nombre;
  String? apellido;
  String? cedula;
  String? telefono;
  String? email;
  String? password;
  String? nickname;
  String? universidad;
  String? carrera;
  String? cargo;

  User({
    required this.nombre,
    required this.apellido,
    required this.cedula,
    required this.telefono,
    required this.email,
    required this.password,
    required this.nickname,
    required this.universidad,
    required this.carrera,
    required this.cargo,
  }
  );

  
  factory User.fromJson(
    Map<String, dynamic> json, value
  ) {
    return User(

      nombre: json['nombre'], 
      apellido: json['apellido'], 
      cedula: json['cedula'],
      telefono: json['telefono'],
      email: json['email'],
      password: json['password'],
      nickname: json['nickName'],
      universidad: json['universidad'], 
      carrera: json['carrera'], 
      cargo: json['cargo']
      );
      
  }
  
  /*
  User.fromJson(Map json)
    : nombre = json['nombre'], 
      apellido= json['apellido'], 
      cedula= json['cedula'],
      telefono= json['telefono'],
      email= json['email'],
      password= json['password'],
      nickname= json['nickName'],
      universidad= json['universidad'], 
      carrera= json['carrera'], 
      cargo= json['cargo'];

      Map toJson() {
        return {'nombre': nombre, 'apellido': apellido, 'cedula': cedula, 'telefono': telefono, 'email': email, 'password': password,
        'nickName': nickname, 'universidad': universidad, 'carrera': carrera, 'cargo': cargo};
      }
      */
}





