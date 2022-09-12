import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:flutter_sms/flutter_sms.dart';

import '../model/patient_id.dart';
import '../screen/complete.dart';

class Q3 extends StatefulWidget {
  //const q3({Key? key}) : super(key: key);

  Q3(
      {required this.employee_id,
      required this.uname,
      required this.pname,
      required this.doc,
      required this.sex,
      required this.member,
      required this.dob,
      required this.address,
      required this.mobile,
      required this.married_status,
      required this.nochild,
      required this.height,
      required this.pid,
      required this.pstatus,
      required this.mothername});

  String employee_id;
  String uname;
  String pname;
  String doc;
  String sex;
  String member;
  String dob;
  String address;
  String mobile;
  String married_status;
  String nochild;
  String height;
  String mothername;

  String pid;
  String pstatus;

  @override
  State<Q3> createState() => _Q3State();
}

enum Diabetics { Yes, No, notKnown }

class _Q3State extends State<Q3> {
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

  bool isdisable = false;

  bool isdisablediabetics = true;

  @override
  void initState() {
    super.initState();
    isdisable = false;
    print(isdisable);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("AGCRC – Digital Health Services"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '12. Weight (KG)',
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
                      '13. Pulse',
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
                      '14. Blood Pressure',
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '15. Diabetic',
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
                              db = "No";
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
                              db = "Not Known";
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
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
                      '16. Major Complain of Today',
                      style: GoogleFonts.roboto(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: isdisable
                              ? null
                              : () async {
                                  print(widget.employee_id);
                                  print(isdisable);
                                  print("da" + db);
                                  setState(() {
                                    isdisable = true;
                                  });

                                  var response = await http.post(
                                      Uri.parse(
                                          "http://agcrcdigitalhealthservices.cloud-ag.net/ag_servey_data.php"),
                                      body: jsonEncode(<String, String>{
                                        "employee_id": widget.employee_id,
                                        "uname": widget.uname,
                                        "pname": widget.pname,
                                        "doc": widget.doc,
                                        "sex": widget.sex,
                                        "member": widget.member,
                                        "dob": widget.dob,
                                        "address": widget.address,
                                        "mobile": widget.mobile,
                                        "married_status": widget.married_status,
                                        "nochild": widget.nochild,
                                        "height": widget.height,
                                        "weight": weight,
                                        "pulse": pulse,
                                        "systolic": systolic,
                                        "diastolic": diastolic,
                                        "diabetic": db,
                                        "major_complain": mct,
                                        "diabeticvalue": diabeticvalue,
                                        "councilor": '',
                                        "mothername": widget.mothername,
                                      }));

                                  late PatientId data;

                                  data = patientIdFromJson(response.body);

                                  var responsedetails = await http.post(
                                      Uri.parse(
                                          "http://agcrcdigitalhealthservices.cloud-ag.net/ag_servey_details_insert.php"),
                                      body: jsonEncode(<String, String>{
                                        "pid": data.pid,
                                        "employee_id": widget.employee_id,
                                        "uname": widget.uname,
                                        "pname": widget.pname,
                                        "doc": widget.doc,
                                        "sex": widget.sex,
                                        "member": widget.member,
                                        "dob": widget.dob,
                                        "address": widget.address,
                                        "mobile": widget.mobile,
                                        "married_status": widget.married_status,
                                        "nochild": widget.nochild,
                                        "height": widget.height,
                                        "mothername": widget.mothername,
                                        "weight": weight,
                                        "systolic": systolic,
                                        "diastolic": diastolic,
                                        "diabetic": db,
                                        "major_complain": mct,
                                        "pulse": pulse,
                                        "obv": '',
                                        "sma": '',
                                        "smo": '',
                                        "voicechat": '',
                                        "councilor": '',
                                        "diabeticvalue": diabeticvalue,
                                      }));

                                  print(responsedetails.body);

                                  Future.delayed(Duration(seconds: 3), () {
                                    CircularProgressIndicator();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => completed(
                                                  employee_id:
                                                      widget.employee_id,
                                                  uname: widget.uname,
                                                  pid: data.pid,
                                                )));
                                  });
                                },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0),
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
                            padding: const EdgeInsets.all(0),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
