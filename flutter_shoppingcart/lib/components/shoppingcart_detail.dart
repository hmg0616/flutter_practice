import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ShoppingCartDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            _buildDetailNameAndPrice(),
            _buildDetailRatingAndReviewCount(),
            _buildDetailColorOptions(),
            _buildDetailButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailNameAndPrice() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Urban soft AL 10.0",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "\$699",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
  Widget _buildDetailRatingAndReviewCount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star,color: Colors.yellow,),
          Spacer(),
          Text("review "),
          Text(
            "(26)",
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }

  Widget _buildDetailColorOptions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Color Options"),
          SizedBox(height: 10.0),
          Row(
            children: [
              _buildDetailIcon(Colors.black),
              _buildDetailIcon(Colors.green),
              _buildDetailIcon(Colors.orange),
              _buildDetailIcon(Colors.grey),
              _buildDetailIcon(Colors.white),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDetailIcon(Color mColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              shape: BoxShape.circle
            ),
          ),
          Positioned(
            // ????????? ?????? : (???????????? - ????????????) / 2
            left: 5,
            top: 5,
            child: ClipOval( // ClipOver??? ????????? ????????? ?????? ??? ?????? ????????? ?????? ??? ????????????.
              child: Container(
                width: 40,
                height: 40,
                color: mColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text("??????????????? ??????????????????????"),
            actions: [
              CupertinoDialogAction(
                child: Text("??????"),
                onPressed: () {
                    print("??????????????? ??????");
                    Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
      child: Text(
        "Add to Cart",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
        backgroundColor: kAccentColor,
        minimumSize: Size(300, 50),
        shape: RoundedRectangleBorder( // ????????????!!
          borderRadius: BorderRadius.circular(20)
        )
      ),
    );
  }
}
