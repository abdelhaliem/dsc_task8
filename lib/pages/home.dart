import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TimeOfDay _timeNew;
  DateTime _dateNew;

  void showTime() async {
    var time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now())
            .then((value) {
      setState(() {
        _timeNew = value;
        snakBar(
          text: "Time New : ${_timeNew.hour}:${_timeNew.minute}",
          icon: Icons.access_alarms_rounded,
        );
      });
    });
    print(_timeNew);
  }

  void showdate() async {
    var date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2100))
        .then((value) {
      setState(() {
        _dateNew = value;
        snakBar(
          text: "Date New : ${DateFormat.yMMMd().format(_dateNew)} ",
          icon: Icons.calendar_today_rounded,
        );
      });
    });
    print(_dateNew);
  }

  final _x = GlobalKey<ScaffoldState>();
  snakBar({String text, IconData icon}) {
    final sBar = SnackBar(
      backgroundColor: Colors.yellow[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      duration: Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(text,
              textAlign: TextAlign.center,
              style: GoogleFonts.actor(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              )),
        ],
      ),
    );
    _x.currentState.showSnackBar(sBar);
  }

  var y = Colors.yellow[800];
  var b = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _x,
      appBar: AppBar(
        backgroundColor: y,
        title: Text(
          "Time & Date",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boxContainer(
              text1: "Date New :",
              title1: _dateNew == null
                  ? ""
                  : "${DateFormat.yMMMd().format(_dateNew)} ",
              text2: "Time New :",
              title2:
                  _timeNew == null ? "" : "${_timeNew.hour}:${_timeNew.minute}",
            ),

            SizedBox(
              height: 30,
            ),
            InkWell(
              child: Column(
                children: [
                  Text(
                    "Set Time And Date",
                    style: TextStyle(
                        color: y, fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    endIndent: 50,
                    indent: 50,
                    thickness: 1,
                    color: b,
                  ),
                  Text(
                    "--< Thanks DSC Al-Azhar University >--",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: y,
                    ),
                  ),
                ],
              ),
              onTap: () {
                showTime();
                showdate();
              },
            ),
            //  ElevatedButton(onPressed: () {}, child: Text("mmdsn,"))
          ],
        ),
      ),
    );
  }
}

Widget boxContainer(
    {String title1, String text1, String title2, String text2}) {
  return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(6, 6),
          ),
          BoxShadow(
            color: Colors.white,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(100),
        color: Colors.yellow[800],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text(
            text: text1,
            fontSize: 20,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          text(
            text: title1,
            fontSize: 25,
            color: Colors.white,
          ),
          Divider(
            color: Colors.black,
            height: 30,
            thickness: 1,
          ),
          text(
            text: text2,
            fontSize: 20,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          text(
            text: title2,
            fontSize: 25,
            color: Colors.white,
          ),
        ],
      ));
}

Widget text({String text, double fontSize, Color color}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: fontSize,
    ),
  );
}
