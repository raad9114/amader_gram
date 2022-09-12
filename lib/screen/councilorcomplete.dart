import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amader_gram_main/screen/1q.dart';
import '../main.dart';

class Councilor_Complete extends StatefulWidget {

  const Councilor_Complete({Key? key}) : super(key: key);


  @override
  State<Councilor_Complete> createState() => _Councilor_CompleteState();
}

class _Councilor_CompleteState extends State<Councilor_Complete> {
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }


  void _sendSMS(String message, List<String> recipents) async {
   // print(recipents);
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
    //  print(onError);
    });
   // print(_result);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,

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
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Completed!',
                    style: GoogleFonts.lato(
                      fontSize: 40.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // RaisedButton(
                  //   onPressed: () {
                  //     String message = "AGCRC – Digital Health Services\nPatient ID: ${widget.pid}\nDate of Consultation: ${widget.DOC}\nName: ${widget.pname}\nDate of Birth: ${widget.DOB}\nGender: ${widget.gender}\nMembership Status: ${widget.member}\nBlood Pressure: ${widget.BPs}/${widget.BPd}\nDiabetes Update: ${widget.diabetes}\nMajor Complain: ${widget.major}\nObservation/Tests Done by Medical Assistant: ${widget.obsMA}\nSuggestion From Medical Assistant: ${widget.sugMA}\nSuggestion From Medical Officer: ${widget.sugMO}";
                  //     List<String> recipents = ["${widget.pnumber}"];
                  //     _sendSMS(message, recipents);
                  //   },
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(80.0)),
                  //   textColor: Colors.white,
                  //   padding: const EdgeInsets.all(0),
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 50.0,
                  //     width: MediaQuery.of(context).size.width * 0.5,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(80.0),
                  //         gradient: LinearGradient(colors: [
                  //           Color.fromARGB(255, 255, 136, 34),
                  //           Color.fromARGB(255, 255, 177, 41)
                  //         ])),
                  //     padding: const EdgeInsets.all(0),
                  //     child: Text(
                  //       "Send Message",
                  //       textAlign: TextAlign.center,
                  //       style: GoogleFonts.roboto(
                  //         fontSize: 18,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyApp()), (route) => false);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => MyApp()));
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
                          gradient: new LinearGradient(
                              colors: [Color(0xff9C151C), Color(0xff9C151C)])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Logout",
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
      ),
    );
  }
}
