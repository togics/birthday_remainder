import 'package:birthday_remainder/navigations/drawer_navigation.dart';
import 'package:birthday_remainder/screens/events_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
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
  _showFromDialog(BuildContext context){
    return showDialog(
        context: context,barrierDismissible: true, builder: (param){
        return AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: (){
              Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(onPressed: (){

            },
              child: Text("save"),
            ),
          ],

          title: Text('Create New Birthday'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter the name",
                    labelText: "Name"
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Phone number",
                      labelText: "Phone number"
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date"),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                      ),
                      child:Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                        color: Colors.blueAccent,
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
                //
                //   ,
                //   child: Text('Select date'),
                // ),
              ],
            ),
          ),
        );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text("Home page"),
        backgroundColor: Colors.grey,
      ),
      drawer: DrawerNavigator(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: SizedBox(
              height: 180.0,
              child: Card(
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                        onPressed: (){},
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("08 Feb,2021"),
                                TextButton(
                                    onPressed: (){},
                                    child: Icon(Icons.calendar_today)
                                ),
                              ],
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0,),
            child: Text("Today!",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 25.0,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                SizedBox(
                  height: 100.0,
                  child: Card(
                    child:Text("Date",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: (){
      _showFromDialog(context);
    },
    ),
    );
  }
}
