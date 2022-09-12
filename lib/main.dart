import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amader_gram_main/ui/background/background.dart';

import 'screen/login_form.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amader Gram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 3.5,
          titleTextStyle: GoogleFonts.roboto(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            Positioned(
              top: 110,
              right: 10,
              left: 10,
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
