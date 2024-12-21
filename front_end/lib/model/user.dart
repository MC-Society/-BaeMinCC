class User {
  String nickname;
  String id;
  String password;

  User(this.nickname, this.id, this.password);

  User.fromList(Map<String, dynamic> map)
      : nickname = map['nickname'],
        id = map['id'],
        password = map['password'];
}
