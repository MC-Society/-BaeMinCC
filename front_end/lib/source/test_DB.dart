import 'package:front_end/model/user.dart';

class UserList {
  static List<User> userList = [
    User.signup({'nickname': 'test1', 'id': 'qwer', 'password': '123'}),
    User.signup({'nickname': 'test2', 'id': 'qwert', 'password': '1234'}),
    User.signup({'nickname': 'test3', 'id': 'qwerty', 'password': '12345'}),
  ];
}

class UserInfo {
  static User userInfo = User.userInfo({'nickname': 'test1', 'id': 'qwer'});
}
