import 'package:flutter/material.dart';
import 'package:flutter_airbnb/components/home/home_body_banner.dart';
import 'package:flutter_airbnb/components/home/home_body_popular.dart';
import 'package:flutter_airbnb/size.dart';

class HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double bodyWidth = getBodyWidth(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Align( // 디폴트 가운데 정렬
      child: SizedBox( // ListView 안에 children은 width를 최대로 잡음. 그래서 SizedBox로 width 설정해도 안먹음. 이럴때는 Align으로 한번 감싸주기.
        width: screenWidth < 420 ? double.infinity : bodyWidth, // 화면의 70프로
        child: Column(
          children: [
            HomeBodyBanner(),
            HomeBodyPopular()
          ],
        ),
      ),
    );
  }
}
