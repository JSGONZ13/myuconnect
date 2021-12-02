// ignore_for_file: prefer_initializing_formals

class User {
  late String id,
      nombre,
      apellido,
      cedula,
      telefono,
      correo,
      password,
      nickname,
      universidad,
      carrera,
      cargo;

  User(
      String nombre,
      String apellido,
      String cedula,
      String telefono,
      String correo,
      String password,
      String nickname,
      String universidad,
      String carrera,
      String cargo) {
    this.nombre = nombre;
    this.apellido = apellido;
    this.cedula = cedula;
    this.telefono = telefono;
    this.correo = correo;
    this.password = password;
    this.nickname = nickname;
    this.universidad = universidad;
    this.carrera = carrera;
    this.cargo = cargo;
  }
  
}
