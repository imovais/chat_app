class UserModel {
  String id;
  String username;
  String email;

  UserModel(this.id, this.username, this.email);

  Map<String, dynamic> tojson() {
    return {'id': id, 'username': username, 'email': email};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'] as String,
      map['username'] as String,
      map['email'] as String,
    );
  }

  void add(UserModel user) {}
}
