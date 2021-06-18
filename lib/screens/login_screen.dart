import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:birthday_remainder/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1930, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFF21D2FF),
              Color(0xFF940EFC)
            ],
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome To Our Brithday Remainder App",
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              CircleAvatar(
                radius: 65.0,
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Phone number",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Phone number",
                        labelText: "Phone number",
                        labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                          child:Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          onPressed:() => _selectDate(context),),
                        SizedBox(
                          child: Container(
                            color: Colors.grey,
                          ),
                          height: 1.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0,vertical: 10.0,),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white10,
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      },
                    child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
