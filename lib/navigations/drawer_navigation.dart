import 'package:birthday_remainder/screens/events_screen.dart';
import 'package:birthday_remainder/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DrawerNavigator extends StatefulWidget {
  @override
  _DrawerNavigatorState createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(

                backgroundColor: Colors.grey,
              ),
              accountName: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("user name"),
                  Text("phone number"),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()),);
              } ,
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text("Events"),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>EventScreen()),);
              } ,
            ),
          ],
        ),
      ),
    );
  }
}
