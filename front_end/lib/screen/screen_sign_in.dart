import 'package:flutter/material.dart';
import 'package:front_end/model/user.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _loginState = false;

  final List<User> _userList = [
    User.fromList({'nickname': 'test1', 'id': 'qwer', 'password': '123'}),
    User.fromList({'nickname': 'test2', 'id': 'qwert', 'password': '1234'}),
    User.fromList({'nickname': 'test3', 'id': 'qwerty', 'password': '12345'}),
  ];

  void _login() {
    if (_formKey.currentState!.validate()) {
      // 로그인 로직을 여기에 추가
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            Text("로그인 시도중..."),
            // 남은 Row의 공간을 꽉 채움
            // CircularProgressIndicator를 오른쪽 끝으로 보내기 위함
            Expanded(child: Container(height: 0)),
            // 로딩표시
            CircularProgressIndicator(),
          ],
        ),
      ));
      for (int i = 0; i < _userList.length; i++) {
        if (_email == _userList[i].id && _password == _userList[i].password) {
          setState(() {
            _loginState = true;
          });
        }
      }
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (_loginState) {
        print('로그인 성공@@');
      } else {
        print('로그인 실패 ㅠㅠ');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    if (!_loginState) {
      //로그인 화면
      return Scaffold(
        appBar: AppBar(
          title: Text('로그인'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.048, height * 0.25, width * 0.048, height * 0.024),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: '이메일'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력하세요.';
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '비밀번호'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력하세요.';
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: height * 0.08),
                  child: Column(children: <Widget>[
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(width * 0.25,
                              height * 0.01, width * 0.25, height * 0.01),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        '로그인',
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.08),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.01)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '아직 아이디가 없으신가요 ? ',
                          style: TextStyle(fontSize: width * 0.034),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              '회원가입',
                              style: TextStyle(fontSize: width * 0.034),
                            ),
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0)))
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // 로그인 성공 화면
      return Scaffold(
          body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: height * 0.32)),
            Align(
                alignment: Alignment.center, // 왼쪽 정렬
                child: Text(
                  '로그인 성공!',
                  style: TextStyle(
                      fontSize: width * 0.12, fontWeight: FontWeight.bold),
                )),
            Padding(padding: EdgeInsets.only(top: height * 0.05)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _loginState = !_loginState;
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.15, height * 0.01, width * 0.15, height * 0.01),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                '메인 화면으로',
                style: TextStyle(color: Colors.white, fontSize: width * 0.08),
              ),
            ),
          ],
        ),
      ));
    }
  }
}
