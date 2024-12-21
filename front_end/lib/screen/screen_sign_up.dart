import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nicknameController;
  late TextEditingController passwordController;
  late TextEditingController passwordCheckController;
  bool isNicknameChecked = false; // 닉네임 입력 여부
  bool isPasswordChecked = false;
  bool isSignUpCompleted = false;

  @override
  void initState() {
    super.initState();
    nicknameController = TextEditingController();
    passwordController = TextEditingController();
    passwordCheckController = TextEditingController();
  }

  @override
  void dispose() {
    nicknameController.dispose();
    passwordController.dispose();
    passwordCheckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면의 너비와 높이를 가져옵니다.
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    if (isSignUpCompleted) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              setState(() {
                nicknameController.clear();
                passwordController.clear();
                passwordCheckController.clear();

                isPasswordChecked = false;
                isSignUpCompleted = false;
                isNicknameChecked = false;
              });
              // Navigator.pop(context); // 뒤로가기 동작
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 버튼을 하단으로 붙이기
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                    child: Text(
                      ' 회원가입이\n 완료되었습니다',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: width * 0.1,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.6,
                  ),
                  SizedBox(
                    width: width * 1.0,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (nicknameController.text.isNotEmpty) {
                            isNicknameChecked = true;
                          }
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        overlayColor: const Color.fromARGB(255, 168, 168, 168),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: const Text(
                        '로그인하기',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              print("뒤로가기 버튼");
              setState(() {
                isNicknameChecked = false;
                nicknameController.clear();
                passwordController.clear();
                passwordCheckController.clear();
              });
              // Navigator.pop(context); // 뒤로가기 동작
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 버튼을 하단으로 붙이기
            children: [
              Column(
                children: [
                  if (!isNicknameChecked) // 닉네임 입력 여부에 따라 표시
                    Align(
                      alignment: Alignment.centerLeft, // 왼쪽 정렬
                      child: Text(
                        ' 회원가입\n 해주세용',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: width * 0.1,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                      ),
                    ),
                  SizedBox(height: height * 0.18),
                  TextField(
                    controller: nicknameController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black), // 기본 아래 줄 색상
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black), // 비활성화 상태 아래 줄 색상
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black), // 활성화 상태 아래 줄 색상
                      ),
                      labelText: '닉네임',
                      labelStyle: TextStyle(
                        color: Colors.black, // 라벨 텍스트 색상
                      ),
                    ),
                  ),
                  if (!isNicknameChecked) // 닉네임 입력 시 설명 텍스트
                    Align(
                      alignment: Alignment.centerLeft, // 왼쪽 정렬
                      child: Text(
                        '띄어쓰기, 특수문자 !@#\$%^&*() 는 사용할 수 없어요 (최대 15자)',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: width * 0.031,
                        ),
                      ),
                    )
                  else
                    Align(
                      alignment: Alignment.centerLeft, // 왼쪽 정렬
                      child: Text(
                        '사용할 수 있는 닉네임 입니다.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 51, 111, 53),
                          fontSize: width * 0.031,
                        ),
                      ),
                    ),
                  if (isNicknameChecked) // 닉네임 입력 후 패스워드 입력란 추가
                    Column(
                      children: [
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black), // 기본 아래 줄 색상
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // 비활성화 상태 아래 줄 색상
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // 활성화 상태 아래 줄 색상
                            ),
                            labelText: '비밀번호',
                            labelStyle: TextStyle(
                              color: Colors.black, // 라벨 텍스트 색상
                            ),
                          ),
                          obscureText: true, // 비밀번호 입력 시 텍스트를 숨김
                        ),
                        Align(
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: Text(
                            '영문, 숫자, 특수문자 허용 (8~15자리)',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: width * 0.031,
                            ),
                          ),
                        ),
                        TextField(
                          controller: passwordCheckController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black), // 기본 아래 줄 색상
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // 비활성화 상태 아래 줄 색상
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // 활성화 상태 아래 줄 색상
                            ),
                            labelText: '비밀번호 확인',
                            labelStyle: TextStyle(
                              color: Colors.black, // 라벨 텍스트 색상
                            ),
                          ),
                          obscureText: true, // 비밀번호 입력 시 텍스트를 숨김
                          onChanged: (value) {
                            setState(() {
                              if (passwordController.text == value) {
                                isPasswordChecked = true;
                              } else {
                                isPasswordChecked = false;
                              }
                            });
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: Text(
                            isPasswordChecked ? '' : '비밀번호를 확인해주세요',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: width * 0.031,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              if (!isNicknameChecked || isPasswordChecked)
                Column(
                  children: [
                    SizedBox(
                      width: width * 1.0,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (nicknameController.text.isNotEmpty) {
                              isNicknameChecked = true;
                            }
                            if (isNicknameChecked && isPasswordChecked) {
                              isSignUpCompleted = true;
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          overlayColor:
                              const Color.fromARGB(255, 168, 168, 168),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: const Text(
                          '확인하기',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    )
                  ],
                )
            ],
          ),
        ),
      );
    }
  }
}
