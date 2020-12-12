import 'package:flutter/material.dart';

import '../theme.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: kbackgroundColor,
    elevation: 0.0,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: kprimaryColor,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
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
  );
}
