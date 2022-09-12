import 'package:amader_gram_main/screen/follow_up_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amader_gram_main/screen/1q.dart';

class Welcome extends StatefulWidget {
  Welcome({required this.employee_id, required this.uname});

  String employee_id;
  String uname;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('images/ag.png'),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('images/agwritten.png'),
                ),
                // Text(
                //   "Digital Health Services",
                //   style: GoogleFonts.roboto(
                //     fontSize: 22.0,
                //     color: Colors.black,
                //   ),
                // ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height/6,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => q1(
                                  employee_id: widget.employee_id,
                                  uname: widget.uname,
                                )));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient:  LinearGradient(colors: [
                          Color(0xff336633),
                          Color(0xff1ED6B3),
                          Color(0xff336633)
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "New Patient",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Follow_up_search(
                              uname: widget.uname,
                              employee_id: widget.employee_id,
                            )));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient:  LinearGradient(colors: [
                          Color(0xff330066),
                          Color(0xff333399),
                          Color(0xff330066)
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "Follow-Up",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
