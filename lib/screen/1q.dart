import 'dart:convert';

import 'package:amader_gram_main/screen/login_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:amader_gram_main/screen/q2.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class q1 extends StatefulWidget {
  q1({required this.employee_id, required this.uname});

  String employee_id;
  String uname;

  @override
  State<q1> createState() => _q1State();
}

enum Gender { Male, Female }

enum MemberStatuse { Member, NonMember }

class _q1State extends State<q1> {
  late String _DOC = '';
  late String _DOB = '';
  late String sex = "";

  Gender? gender = Gender.Male;
  MemberStatuse? membership = MemberStatuse.Member;

  late String name = '';
  late String mothername = '';
  late String m = 'Member';
  late String s = 'Male';
  late String pid = '';

  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String date1 = DateFormat("yyyy-MM-dd").format(DateTime.now());

  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  //bool value = false;

  Future _showFromDatePicker() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2023));

    if (picked != null) {
      setState(() => _DOC = DateFormat("dd-MM-yyyy").format(picked).toString());
    }
  }

  Future _showFromDatePickerDOB() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2023));

    if (picked != null) {
      setState(() => _DOB = DateFormat("dd-MM-yyyy").format(picked).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "AGCRC – Digital Health Services",
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => MyApp()));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false);
                  },
                  icon: Icon(Icons.logout, color: Colors.black)),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '1. Name',
                    style: GoogleFonts.roboto(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    child: Card(
                      elevation: 5,
                      child: TextField(
                        onChanged: (input) {
                          name = input;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            //  errorText: "Can't Be Empty",
                            border: OutlineInputBorder()),
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "2. Mother's Name",
                    style: GoogleFonts.roboto(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    child: Card(
                      elevation: 5,
                      child: TextField(
                        onChanged: (input) {
                          mothername = input;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            //  errorText: "Can't Be Empty",
                            border: OutlineInputBorder()),
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '3. Date of Consultation',
                    style: GoogleFonts.roboto(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        height: 60,
                        // alignment: Alignment.center,
                        //  margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        // padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40,
                              ),
                              FlatButton(
                                color: Color(0xfffafafa),
                                onPressed: () {
                                  _showFromDatePicker();
                                },
                                child: Icon(
                                  Icons.calendar_today_sharp,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                _DOC,
                                style: GoogleFonts.roboto(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '4. Gender',
                    style: GoogleFonts.roboto(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Male',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<Gender>(
                          value: Gender.Male,
                          groupValue: gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              gender = value;
                              s = 'Male';
                            });
                          },
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Female',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<Gender>(
                          value: Gender.Female,
                          groupValue: gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              gender = value;
                              s = 'Female';
                            });
                          },
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '5. Membership',
                    style: GoogleFonts.roboto(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Member',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<MemberStatuse>(
                          value: MemberStatuse.Member,
                          groupValue: membership,
                          onChanged: (MemberStatuse? value) {
                            setState(() {
                              membership = value;
                              m = "Member";
                            });
                          },
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Non-Member',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<MemberStatuse>(
                          value: MemberStatuse.NonMember,
                          groupValue: membership,
                          onChanged: (MemberStatuse? value) {
                            setState(() {
                              membership = value;
                              m = "Non-Member";
                            });
                          },
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '6. Date of Birth',
                    style: GoogleFonts.roboto(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        // alignment: Alignment.center,
                        //  margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        // padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40,
                              ),
                              FlatButton(
                                color: Color(0xfffafafa),
                                onPressed: () {
                                  _showFromDatePickerDOB();
                                },
                                child: Icon(
                                  Icons.calendar_today_sharp,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                _DOB,
                                style: GoogleFonts.roboto(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Q2(
                                    employee_id: widget.employee_id,
                                    uname: widget.uname,
                                    pname: name,
                                    doc: _DOC,
                                    sex: s,
                                    member: m,
                                    dob: _DOB,
                                    pid: pid,
                                    pstatus: "",
                                    mothername: mothername)));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: new LinearGradient(colors: [
                              Color.fromARGB(255, 255, 136, 34),
                              Color.fromARGB(255, 255, 177, 41)
                            ])),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Next",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
