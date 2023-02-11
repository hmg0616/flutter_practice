
// 마진, 여백 (간격)
import 'package:flutter/cupertino.dart';

const double gap_xl = 40;
const double gap_l = 30;
const double gap_m = 20;
const double gap_s = 10;
const double gap_xs = 5;

const double header_height = 620;

// 화면 넓이의 70프로!!
// MediaQuery 사용하면 화면 사이즈를 받을 수 있다.
double getBodyWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.7;
}