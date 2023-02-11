
import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';


import 'package:get/get_connect/http/src/response/response.dart';import '../../controller/dto/CMResponseDto.dart';
import '../../util/jwt.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print(loginReqDto.toJson());
    Response response =  await _userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers;
    dynamic body = response.body;
    //print("사용자 정보 : $body");

    // dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글깨짐 해결
    CMResponseDto cmResponseDto = CMResponseDto.fromJson(body);

    if(cmResponseDto.code == 1) {
      User principal = User.fromJson(cmResponseDto.data);

      String token = headers["authorization"];
      jwtToken = token;
      print("jwtToken : $jwtToken");

      return principal;
    } else {
      return User();
    }

//    if(headers["authorization"] == null) {
//      return "-1";
//    } else {
//      String token = headers["authorization"];
//      return token;
//    }
  }
}