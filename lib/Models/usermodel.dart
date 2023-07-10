class UserModel {
  String id;
  String username;
  String email;

  UserModel(this.id, this.username, this.email);

  Map<String, dynamic> tojson() {
    return {'id': id, 'username': username, 'email': email};
  }
}
