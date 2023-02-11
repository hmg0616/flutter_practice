
import 'package:flutter_blog/controller/dto/CMResponseDto.dart';
import 'package:flutter_blog/controller/dto/SaveOrUpdateReqDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get_connect/http/src/response/response.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공!! => json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    Response response =  await _postProvider.findAll();
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글깨짐 해결
    CMResponseDto cmResponseDto = CMResponseDto.fromJson(body);
    print(cmResponseDto.code);
    print(cmResponseDto.msg);
    print(cmResponseDto.data.runtimeType);

    if(cmResponseDto.code == 1) {
      List<dynamic> temp = cmResponseDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[];
    }
  }

  Future<Post> findById(int id) async {
    Response response =  await _postProvider.findById(id);
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글깨짐 해결
    CMResponseDto cmResponseDto = CMResponseDto.fromJson(body);

    if(cmResponseDto.code == 1) {
      Post post = Post.fromJson(cmResponseDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<int> deleteById(int id) async {
    Response response =  await _postProvider.deleteById(id);
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글깨짐 해결
    CMResponseDto cmResponseDto = CMResponseDto.fromJson(body);

    return cmResponseDto.code ?? -1;
  }

  Future<Post> updateById(int id, String title, String content) async {
    SaveOrUpdateReqDto updateReqDto = SaveOrUpdateReqDto(title, content);
    Response response = await _postProvider.updateById(id, updateReqDto.toJson());
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글깨짐 해결
    CMResponseDto cmResponseDto = CMResponseDto.fromJson(body);

    if(cmResponseDto.code == 1) {
      Post post = Post.fromJson(cmResponseDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<Post> save(String title, String content) async {
    SaveOrUpdateReqDto saveReqDto = SaveOrUpdateReqDto(title, content);
    Response response = await _postProvider.save(saveReqDto.toJson());
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글깨짐 해결
    CMResponseDto cmResponseDto = CMResponseDto.fromJson(body);

    if(cmResponseDto.code == 1) {
      Post post = Post.fromJson(cmResponseDto.data);
      return post;
    } else {
      return Post();
    }
  }
}