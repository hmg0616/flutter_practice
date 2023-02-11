import 'package:flutter/material.dart';
import 'package:flutter_airbnb/styles.dart';

class CommonFormField extends StatelessWidget {

  final prefixText;
  final hintText;

  CommonFormField({required this.prefixText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          textAlignVertical: TextAlignVertical.bottom, // 이거 쓰려면 contentPadding을 같이 써야함. padding으로 영역을 키워줘야해서.
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              )
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 20,
          child: Text(
              prefixText,
              style: overLine(),
          ),
        )
      ]
    );
  }
}
