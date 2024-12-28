class User {
  String nickname;
  String id;
  String? password;
  String? address;

  User(this.nickname, this.id, this.password, this.address);

  User.signup(Map<String, dynamic> map)
      : nickname = map['nickname'],
        id = map['id'],
        password = map['password'];

  User.userInfo(Map<String, dynamic> map)
      : nickname = map['nickname'],
        id = map['id'];
}
