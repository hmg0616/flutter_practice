import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {

  final String imageName;
  final String title;

  const RecipeListItem({required this.imageName, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio( // 이미지 비율 설정
            aspectRatio: 2 / 1, // width / height
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/$imageName.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Have you ever made your own $title? ONce you've tried a homemade $title, you'll never go back.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}
