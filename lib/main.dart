import 'package:cookie_store_app/bottom_bar.dart';
import 'package:cookie_store_app/cookie_page.dart';
import 'package:cookie_store_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'VarelaRound',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontSize: 21.0,
              ),
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kprimaryColor,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Pickup',
          style: TextStyle(
            fontSize: 20.0,
            color: kprimaryColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: kprimaryColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 10.0),
          Text(
            'Categories',
            style: TextStyle(
              fontFamily: 'VarelaRound',
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: klabelColor,
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 40.0),
            unselectedLabelColor: kunselectedLabel,
            tabs: [
              Tab(
                child: Text(
                  'Cookies',
                  style: TextStyle(
                    fontFamily: 'VarelaRound',
                    fontSize: 21.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Cookie Cake',
                  style: TextStyle(
                    fontFamily: 'VarelaRound',
                    fontSize: 21.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Ice Cream',
                  style: TextStyle(
                    fontFamily: 'VarelaRound',
                    fontSize: 21.0,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                CookiePage(),
                CookiePage(),
                CookiePage(),
              ],
            ),
          ),
          // SizedBox(height: 15.0)
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
