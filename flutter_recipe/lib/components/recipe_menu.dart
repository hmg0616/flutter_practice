import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildMenuItem(Icons.food_bank, "ALL"),
            SizedBox(width: 25),
            _buildMenuItem(Icons.emoji_food_beverage, "Coffee"),
            SizedBox(width: 25),
            _buildMenuItem(Icons.fastfood, "Burger"),
            SizedBox(width: 25),
            _buildMenuItem(Icons.local_pizza, "Pizza"),
          ],
        ),
      ),
    );
  }

  Container _buildMenuItem(IconData mIcon, String text) {
    return Container(
          height: 80,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                mIcon,
                color: Colors.redAccent,
                size: 30,
              ),
              SizedBox(height: 5),
              Text(text)
            ],
          ),
        );
  }
}
