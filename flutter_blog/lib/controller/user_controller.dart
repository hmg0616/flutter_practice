import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

import '../domain/user/user.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수, 실시간 변경까지 감지하려면 Obx 함수 써야함
  final principal = User().obs;

  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password);

    if(principal.id != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  void logout() {
    this.isLogin.value = false;
    jwtToken = null;
  }
}