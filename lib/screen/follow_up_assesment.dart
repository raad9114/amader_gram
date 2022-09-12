import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'complete.dart';

class Follow_UP_Assesment extends StatefulWidget {
  //  Follow_UP_Assesment({Key? key}) : super(key: key);

  Follow_UP_Assesment({
    required this.employee_id,
    required this.uname,
    required this.pname,
    required this.sex,
    required this.member,
    required this.dob,required this.doc,
    required this.address,
    required this.mobile,
    required this.maritalStatus,
    required this.nochild,
    required this.height,
    required this.pid,
    required this.mothername,

  });

  String employee_id;
  String uname;
  String pname;
  String sex;
  String member;
  String dob;String doc;
  String address;
  String mobile;
  String maritalStatus;
  String nochild;
  String height;
  String pid;
  String mothername;

  @override
  State<Follow_UP_Assesment> createState() => _Follow_UP_AssesmentState();
}

enum Diabetics { Yes, No, notKnown }

class _Follow_UP_AssesmentState extends State<Follow_UP_Assesment> {
  late String weight = '';
  late String systolic = '';
  late String diastolic = "";
  late String diabeticvalue = "";
  Diabetics? diabetic = Diabetics.Yes;
  late String mct = '';
  late String db = 'Yes';
  String pulse = 'Not Checked';

  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isdisablediabetics = true;

  bool isdisable = false;

  late String _DOC = '';
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  Future _showFromDatePickerDOB() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2023));

    if (picked != null) {
      setState(() => _DOC = DateFormat("dd-MM-yyyy").format(picked).toString());
    }
  }
  @override
  void initState() {
    super.initState();
    isdisable = false;
   // print(isdisable);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black),
            title: Text("AGCRC - Digital Health Services"),
            //automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Patient Name: ${widget.pname}',
                              style: GoogleFonts.roboto(
                                fontSize: 22.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Patient ID: ${widget.pid}',
                              style: GoogleFonts.roboto(
                                fontSize: 22.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Last Visited: ${widget.doc}',
                              style: GoogleFonts.roboto(
                                fontSize: 22.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Date of Follow-up',
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
                          //  margin:  EdgeInsets.fromLTRB(20, 20, 20, 10),
                          // padding:  EdgeInsets.only(bottom: 10),
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
                                 SizedBox(
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
                      '1. Weight (KG)',
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
                            weight = input;
                          },
                          textAlign: TextAlign.center,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2. Pulse',
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
                            pulse = input;
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
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
                      '3. Blood Pressure',
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
                            systolic = input;
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Systolic",
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
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: Card(
                        elevation: 5,
                        child: TextField(
                          onChanged: (input) {
                            diastolic = input;
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Diastolic",
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
                      '4. Diabetic',
                      style: GoogleFonts.roboto(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Yes',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<Diabetics>(
                          value: Diabetics.Yes,
                          groupValue: diabetic,
                          onChanged: (Diabetics? value) {
                            setState(() {
                              diabetic = value;
                              db = "Yes";
                              isdisablediabetics = true;
                            });
                          },
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<Diabetics>(
                          value: Diabetics.No,
                          groupValue: diabetic,
                          onChanged: (Diabetics? value) {
                            setState(() {
                              diabetic = value;
                              db = 'No';
                              isdisablediabetics = false;
                            });
                          },
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Not Known',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<Diabetics>(
                          value: Diabetics.notKnown,
                          groupValue: diabetic,
                          onChanged: (Diabetics? value) {
                            setState(() {
                              diabetic = value;
                              db = 'Not Known';
                              isdisablediabetics = false;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 0),

                      child: Card(
                        elevation: 5,
                        child: TextField(
                          enabled: isdisablediabetics,
                          maxLines: 1,
                          onChanged: (input) {
                            diabeticvalue = input;
                          },
                          textAlign: TextAlign.center,
                          decoration:
                          InputDecoration(border: OutlineInputBorder(),
                              hintText: 'Blood Sugar Value'),
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
                      '5. Major Complain of Today',
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
                          maxLines: 2,
                          onChanged: (input) {
                            mct = input;
                          },
                          textAlign: TextAlign.center,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed:  isdisable ? null : ()   async {
                            setState((){
                              isdisable = true;
                            });



                            var responsedetails = await http.post(
                                Uri.parse("http://agcrcdigitalhealthservices.cloud-ag.net/ag_servey_details_insert.php"),
                                body: jsonEncode(<String, String>{
                                  "pid" : widget.pid,
                                  "employee_id": widget.employee_id,
                                  "uname": widget.uname,
                                  "pname": widget.pname,
                                  "mothername": widget.mothername,
                                  "doc": _DOC,
                                  "sex": widget.sex,
                                  "member": widget.member,
                                  "dob": widget.dob,
                                  "address": widget.address,
                                  "mobile": widget.mobile,
                                  "married_status": widget.maritalStatus,
                                  "nochild": widget.nochild,
                                  "height": widget.height,
                                  "weight": weight,
                                  "pulse": pulse,
                                  "systolic": systolic,
                                  "diastolic": diastolic,
                                  "diabetic": db,
                                  "major_complain": mct,
                                  "diabeticvalue": diabeticvalue,
                                }));

                           // print(responsedetails.body);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => completed(
                                      employee_id: widget.employee_id,
                                      uname: widget.uname,
                                      pid: widget.pid,
                                    )));

                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          textColor: Colors.white,
                          padding:  EdgeInsets.all(0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 55.0,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80.0),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 255, 136, 34),
                                  Color.fromARGB(255, 255, 177, 41)
                                ])),
                            padding:  EdgeInsets.all(0),
                            child: Text(
                              "Complete",
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
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
