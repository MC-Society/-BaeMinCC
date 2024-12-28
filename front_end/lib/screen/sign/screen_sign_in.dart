import 'package:flutter/material.dart';
import 'package:front_end/screen/sign/screen_sign_up.dart';
import 'package:front_end/source/test_DB.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _loginState = false;
  late TextEditingController idController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
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
      // 이 부분을 DB연결구조로 수정예정
      for (int i = 0; i < UserList.userList.length; i++) {
        if (idController.text == UserList.userList[i].id &&
            passwordController.text == UserList.userList[i].password) {
          setState(() {
            _loginState = true;
          });
        }
      }
      ScaffoldMessenger.of(context).hideCurrentSnackBar(); // 스낵바 숨기기기
      if (_loginState) {
        print('로그인 성공@@');
        idController.clear();
        passwordController.clear();
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
                  controller: idController,
                  decoration: InputDecoration(labelText: '아이디'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '아이디를를 입력하세요.';
                    } else
                      return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: '비밀번호'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력하세요.';
                    } else
                      return null;
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
                            onPressed: () {
                              idController.clear();
                              passwordController.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0)),
                            child: Text(
                              '회원가입',
                              style: TextStyle(fontSize: width * 0.034),
                            ))
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
                alignment: Alignment.center,
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
