
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../size.dart';
import 'custom_text_form_field.dart';

class CustomForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 관리하는 글로벌키

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            text: "Email",
            mValide: (value) {
              if(value == null || value.isEmpty) {
                return "Please enter some text";
              } else if (!isEmail(value)) { // validator 라이브러리 함수 사용
                return "이메일 형식이 아닙니다.";
              }
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            text: "Password",
            mValide: (value) {
              if(value == null || value.isEmpty) {
                return "Please enter some text";
              } else if (value.toString().length > 20) {
                return "패스워드의 길이를 초과하였습니다.";
              }
            },
          ),
          SizedBox(height: large_gap),
          TextButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){ // 유효성검사
                  Navigator.pushNamed(context, "/home"); // 화면 위에 화면을 쌓음(스택)
                }
              },
              child: Text("Login")
          )
        ],
      ),
    );
  }
}
