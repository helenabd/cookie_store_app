import 'package:flutter/material.dart';

import './pages/meals_page.dart';
import './meals_data.dart';
import './widgets/bottom_bar.dart';
import './theme.dart';
import './models/category.dart';
import './widgets/app_bar.dart';

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

  List<Category> _availableCategories;

  @override
  void initState() {
    _availableCategories = CATEGORY
        .map((category) => Category(id: category.id, title: category.title))
        .toList();
    super.initState();
    _tabController =
        TabController(length: _availableCategories.length, vsync: this);
  }

  Widget _buildTabBar(String title) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'VarelaRound',
          fontSize: 21.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _availableCategories = CATEGORY
        .map((category) => Category(id: category.id, title: category.title))
        .toList();
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 6.0),
          Text(
            'Categories',
            style: TextStyle(
              color: ktitleColor,
              fontFamily: 'VarelaRound',
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: klabelColor,
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 40.0),
            unselectedLabelColor: kunselectedLabel,
            tabs: [
              for (int i = 0; i < _availableCategories.length; i++)
                _buildTabBar(_availableCategories[i].title),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                for (int i = 0; i < _availableCategories.length; i++)
                  MealsPage(_availableCategories[i].id,
                      _availableCategories[i].title),
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
