import 'package:centauros_app/app/settings/application_assets.dart';
import 'package:centauros_app/views/profile.dart';
import 'package:flutter/material.dart';

import 'clients_page.dart';
import 'contactPage.dart';
import 'event_page.dart';
import 'home_page.dart';
import 'notification_page.dart';

class NavigationDrawer extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return Drawer(
     
     elevation: 25,
     child: ListView(
       padding: EdgeInsets.zero,
       children: <Widget>[
         createDrawerHeader(),
         createDrawerBodyItem(
           icon: Icons.home,
           text: 'Home',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes .home),
         ),
         createDrawerBodyItem(
           icon: Icons.account_circle,
           text: 'Profile',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.profile),
         ),

         createDrawerBodyItem(
           icon: Icons.event_note,
           text: 'Events',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.event),
         ),

          createDrawerBodyItem(
           icon: Icons.people_alt,
           text: 'Clients',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.clients),
         ),
         Divider(),
         createDrawerBodyItem(
           icon: Icons.notifications_active,
           text: 'Notifications',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.notification),
         ),
         createDrawerBodyItem(
           icon: Icons.contact_phone,
           text: 'Contact Info',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.contact),
         ),
         ListTile(
           title: Text('App version 1.0.0'),
           onTap: () {},
         ),
       ],
     ),
   );
 }
 Widget createDrawerBodyItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: ExactAssetImage(ApplicationAssets.imageDrawer))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Welcome to CentaurosApp",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}


}
class PageRoutes {
  static const String home = HomePage.routeName;
  static const String contact = ContactPage.routeName;
  static const String event = EventPage.routeName;
  static const String profile = ProfilePage.routeName;
  static const String notification = NotificationPage.routeName;
  static const String clients = ClientPage.routeName;
}