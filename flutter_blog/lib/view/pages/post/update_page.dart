import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_area.dart';
import '../../components/custom_text_form_field.dart';

class UpdatePage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PostController p = Get.find();
    _title.text = "${p.post.value.title}";
    _content.text = "${p.post.value.content}";

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomTextFormField(
                    controller: _title,
                    hint: "Title",
                    funValidator: validateTitle(),
                  ),
                  CustomTextArea(
                    controller: _content,
                    hint: "Content",
                    funValidator: validateContent(),
                  ),
                  CustomElevatedButton(
                      text: "글 수정하기",
                      funPageRoute: () async {
                        if (_formKey.currentState!.validate()) {
                          await p.updateById(p.post.value.id ?? 0, _title.text, _content.text);
                          Get.back();
                        }
                      }
                  )
                ],
              )
          ),
        ));
  }
}
