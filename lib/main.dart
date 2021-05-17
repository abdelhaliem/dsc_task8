import 'package:flutter/material.dart';
import 'pages/splashScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Time & Date',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.actorTextTheme(textTheme),
        primaryColor: Colors.orange,
      ),
      home: SplahScreen(),
    );
  }
}
