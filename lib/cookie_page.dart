import 'package:cookie_store_app/theme.dart';
import 'package:flutter/material.dart';

class CookiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 30.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard(
                  'Cookie Cream',
                  '\$5.99',
                  'assets/images/cookie_cream2.png',
                  true,
                  false,
                  context,
                ),
                _buildCard(
                  'Cookie Mint',
                  '\$3.99',
                  'assets/images/cookie_mint2.png',
                  false,
                  false,
                  context,
                ),
                _buildCard(
                  'Cookie Choco',
                  '\$2.99',
                  'assets/images/cookie_choco2.png',
                  false,
                  false,
                  context,
                ),
                _buildCard(
                  'Cookie Classic',
                  '\$1.99',
                  'assets/images/cookie_classic2.png',
                  false,
                  true,
                  context,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: kiconPrimaryColor,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: kiconPrimaryColor,
                          )
                  ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                price,
                style: TextStyle(
                  color: ktextPriceColor,
                  fontSize: 16.0,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: ktextNameColor,
                  fontSize: 16.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: kunselectedLabel,
                  height: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      Icon(
                        Icons.shopping_basket,
                        color: kiconPrimaryColor,
                        size: 16.0,
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                          color: kiconPrimaryColor,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                    if (added) ...[
                      Icon(
                        Icons.remove_circle_outline,
                        color: kiconPrimaryColor,
                        size: 16.0,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            color: kiconPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: kiconPrimaryColor,
                        size: 16.0,
                      )
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
