
import 'package:centauros_app/blocs/user_bloc.dart';
import 'package:centauros_app/di/injector.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';
import 'drawer_page.dart';

class ContactPage  extends StatefulWidget {
 static const String routeName = '/contactPage';

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends BaseState<ContactPage,UserBloc> {
 @override
 Widget build(BuildContext context) {
   return new Scaffold(
       appBar: AppBar(
          centerTitle: true,
         title: Text("Contacts"),
       ),
       drawer: NavigationDrawer(),
       body: Center(child: Text("This is contacts page")));
 }

 @override
  UserBloc getBlocInstance() {
  return  UserBloc(
     Injector().providePurchaseOrderUseCase(),
   );
  }
}