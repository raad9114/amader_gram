import 'package:amader_gram_main/screen/q3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Q2 extends StatefulWidget {
  Q2(
      {required this.employee_id,
      required this.uname,
      required this.pname,
      required this.doc,
      required this.sex,
      required this.member,
      required this.dob,
      required this.pid,
      required this.mothername,
      required this.pstatus});

  String employee_id;
  String uname;
  String pname;
  String doc;
  String sex;
  String member;
  String dob;
  String pid;
  String pstatus;
  String mothername;

  @override
  State<Q2> createState() => _Q2State();
}

enum Married_status { Married, Single, Widow }

class _Q2State extends State<Q2> {
  bool isChecked4 = false;
  bool isChecked5 = false;
  late String address = '';
  String mobile = '0';
  late String numberchild = "";
  late String height = '';
  var rampal = ['Sreefaltala', 'Foyla'];
  late String ms = 'Married';

  Married_status? maritalstatus = Married_status.Married;

  String dropdownValue = 'Pick';

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '7. Address',
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
                        child: TextFormField(
                          onChanged: (input) {
                            address = input;
                          },
                          // validator: (input) {
                          //   if (input!.length != 11) {
                          //     return 'Provide Vaild Number';
                          //   }
                          // },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          //keyboardType: TextInputType.number,
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
                      '8. Mobile',
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
                        child: TextFormField(
                          onChanged: (input) {
                            mobile = input;
                          },
                          validator: (input) {
                            if (input!.length != 11) {
                              return 'Provide Vaild Number';
                            }
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
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
                      '9. Marital Status',
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
                          'Single',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<Married_status>(
                          value: Married_status.Single,
                          groupValue: maritalstatus,
                          onChanged: (Married_status? value) {
                            setState(() {
                              maritalstatus = value;
                              ms = "Single";
                            });
                          },
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Married',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<Married_status>(
                          value: Married_status.Married,
                          groupValue: maritalstatus,
                          onChanged: (Married_status? value) {
                            setState(() {
                              maritalstatus = value;
                              ms = "Married";
                            });
                          },
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Widow',
                          style: GoogleFonts.roboto(
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Radio<Married_status>(
                          value: Married_status.Widow,
                          groupValue: maritalstatus,
                          onChanged: (Married_status? value) {
                            setState(() {
                              maritalstatus = value;
                              ms = "Widow";
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '10. Number of Children',
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
                            numberchild = input;
                          },
                          textAlign: TextAlign.center,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
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
                      '11. Height (cm)',
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
                            height = input;
                          },
                          textAlign: TextAlign.center,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: RaisedButton(
                        onPressed: () {
                          if (dropdownValue == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Address Required",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            final formstate = _formkey.currentState;
                            if (formstate!.validate()) {
                              formstate.save();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Q3(
                                            employee_id: widget.employee_id,
                                            uname: widget.uname,
                                            address: address,
                                            mobile: mobile,
                                            married_status: ms,
                                            nochild: numberchild,
                                            height: height,
                                            pname: widget.pname,
                                            doc: widget.doc,
                                            sex: widget.sex,
                                            member: widget.member,
                                            dob: widget.dob,
                                            pid: widget.pid,
                                            pstatus: widget.pstatus,
                                            mothername: widget.mothername,
                                          )));
                            }
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: LinearGradient(colors: [
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
      ),
    );
  }
}
