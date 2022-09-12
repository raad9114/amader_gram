import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../model/patient_details.dart';
import 'assistantcomplete.dart';
import 'package:url_launcher/url_launcher.dart';

import 'councilorcomplete.dart';


class council extends StatefulWidget {
  // const assistantwork({Key? key}) : super(key: key);
  council({required this.id});
  String id;

  @override
  State<council> createState() => _councilState();
}

enum Voicechat { Yes, No }

class _councilState extends State<council> {
  late String councilor = '';


  Voicechat? voicechat = Voicechat.Yes;

  _launch() async {
    const url = 'https://teams.microsoft.com/l/chat/';
    //to active this link need to add permission
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  late PatientDetailsModel patientDetailsModel;

  mobileNumber()async {
    var response = await http.post(Uri.parse('http://agcrcdigitalhealthservices.cloud-ag.net/patient_mobile.php'),
        body: jsonEncode(<String, String>{
          "id": widget.id
        })
    );

    //print(response.body);

    patientDetailsModel = patientDetailsModelFromJson(response.body);

  }

  bool isdisable = false;

  @override
  void initState() {
    super.initState();
    mobileNumber();
    isdisable = false;
  //  print(isdisable);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("AGCRC - Digital Health Services"),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      '16. Observations by Medical Assistant',
                      style: GoogleFonts.roboto(
                        fontSize: 22.0,
                        color: Colors.black,
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
                          councilor = input;
                        },
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        decoration: InputDecoration(border: OutlineInputBorder()),
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
                        onPressed: isdisable ? null : () async {

                          setState((){
                            isdisable = true;
                          });
                          // var response = await http.post(
                          //     // Uri.parse(
                          //     //     'http://agcrcdigitalhealthservices.cloud-ag.net/medicalassistantupdate.php'),
                          //     // body: jsonEncode(<String, String>{
                          //     //   "id": widget.id,
                          //     //   "councilor": councilor,
                          //     // }));
                          var responsedetails = await http.post(
                              Uri.parse(
                                  'http://agcrcdigitalhealthservices.cloud-ag.net/councilor.php'),
                              body: jsonEncode(<String, String>{
                                "pid": widget.id,
                                "councilor": councilor,

                              }));

                       //   print(response.body);
                      //    print(responsedetails.body);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Councilor_Complete(
                                    // pnumber: patientDetailsModel.mobile,
                                    // pid: patientDetailsModel.id,
                                    // pname: patientDetailsModel.pname,
                                    // DOC: patientDetailsModel.doc,
                                    // BPs: patientDetailsModel.systolic,
                                    // DOB: patientDetailsModel.dob,
                                    // BPd: patientDetailsModel.diastolic,
                                    // gender: patientDetailsModel.sex,
                                    // member: patientDetailsModel.membership,
                                    // major: patientDetailsModel.complainOfDay,
                                    // diabetes: patientDetailsModel.diabeticStatus,
                                    // sugMO: suggestion_mo,
                                    // sugMA: suggestion_ma,
                                    // obsMA: observation_ma,
                                  )));
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
    );
  }
}
