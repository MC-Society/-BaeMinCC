import 'package:front_end/model/user.dart';

class UserList {
  static List<User> userList = [
    User.fromList({'nickname': 'test1', 'id': 'qwer', 'password': '123'}),
    User.fromList({'nickname': 'test2', 'id': 'qwert', 'password': '1234'}),
    User.fromList({'nickname': 'test3', 'id': 'qwerty', 'password': '12345'}),
  ];
}
