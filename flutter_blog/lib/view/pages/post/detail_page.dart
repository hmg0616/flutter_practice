import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

import '../../../controller/post_controller.dart';
import 'home_page.dart';

class DetailPage extends StatelessWidget {

  final int? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {

    // String data = Get.arguments;
    UserController u = Get.find();
    PostController p = Get.find();
    print("로그인 유저아이디 : ${u.principal.value.id}");

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${p.post.value.title}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                  ),
                ),
                Divider(),
                u.principal.value.id == p.post.value.user!.id ? Row(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              await p.deleteById(p.post.value.id!);
                              Get.off(() => HomePage()); // 다음화면으로 이동하고 이전화면으로는 못돌아감 (로그인 화면 등에서 사용)
                            },
                            child: Text("삭제")
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: (){
                              Get.to(UpdatePage());
                            },
                            child: Text("수정")
                        ),
                      ]
                  ) : SizedBox(),
                Expanded(
                  child: SingleChildScrollView(
                      child: Text("${p.post.value.content}")
                  ),
                ),
              ],
            )
        ),
      )
    );
  }
}
