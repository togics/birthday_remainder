import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const XRemainDateTimeStyle = TextStyle(fontSize: 16.0,color: Color(0xFF2843B3),);
const XBirthdayPersonTextStyle = TextStyle(fontSize: 27.0,color: Color(0xFF2843B3),);

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}
class _EventScreenState extends State<EventScreen> {

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
          appBar: AppBar(
            title: Text("Events"),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF21D2FF),
                    Color(0xFF940EFC)
                  ],
                ),
              ),
            child: Column(
              children: [
                EventsCard(),
                EventsCard(),
                EventsCard(),
                EventsCard(),
                EventsCard(),
              ],
            ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showFromDialog(context);
        },
        child: Icon(Icons.add),
      ),
      );
  }
}
class EventsCard extends StatelessWidget {
  const EventsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 10.0,
      shadowColor: Colors.black,
      margin: const EdgeInsets.all(15.0),
      color: Color(0xCCFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0,),
            child: Row(
              children: [
                Text("DD-MM",style: XRemainDateTimeStyle,textAlign: TextAlign.left,),
                Spacer(),
                Text("Hr:mm",style: XRemainDateTimeStyle,textAlign: TextAlign.right,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("chandralingam",style: XBirthdayPersonTextStyle,),
          ),
        ],
      ),
    );
  }
}

