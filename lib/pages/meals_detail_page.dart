import 'package:cookie_store_app/main.dart';
import 'package:cookie_store_app/theme.dart';
import 'package:cookie_store_app/widgets/app_bar.dart';
import 'package:cookie_store_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class MealsDetailPage extends StatelessWidget {
  final String category;
  final String name;
  final String price;
  final String imgPath;
  final String description;

  MealsDetailPage(
      {this.category, this.name, this.price, this.imgPath, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        children: [
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              category,
              style: TextStyle(
                color: ktitleColor,
                fontFamily: 'VarelaRound',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Hero(
            tag: imgPath,
            child: Image.asset(
              imgPath,
              height: 150.0,
              width: 100.0,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 28.0),
          Center(
            child: Text(
              '\$' + price,
              style: TextStyle(
                color: ktextPriceColor,
                fontFamily: 'VarelaRound',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              name,
              style: TextStyle(
                color: ktextNameColor,
                fontFamily: 'VarelaRound',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextDescriptionColor,
                  fontFamily: 'VarelaRound',
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: ksecundaryColor,
                ),
                child: Center(
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontFamily: 'VarelaRound',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ksecundaryColor,
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
