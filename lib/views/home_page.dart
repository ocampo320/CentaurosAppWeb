import 'package:flutter/material.dart';

import 'drawer_page.dart';

class HomePage extends StatelessWidget {
 static const String routeName = '/homePage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text("Home"),
       ),
       drawer: NavigationDrawer(),
              body: Center(child: Text("This is home page")));
 }
}