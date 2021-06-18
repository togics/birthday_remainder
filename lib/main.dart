import 'package:birthday_remainder/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main()=> runApp(BirthdayRemainder());

class BirthdayRemainder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child:  LoginScreen(),

      ),
    );
  }
}
