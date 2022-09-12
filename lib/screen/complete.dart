import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amader_gram_main/screen/1q.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class completed extends StatefulWidget {
  completed({required this.employee_id, required this.uname, required this.pid});
  String employee_id;
  String uname;
  String pid;

  @override
  State<completed> createState() => _completedState();
}

class _completedState extends State<completed> {

  String dropdownValue = 'Pick';

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void _sendSMS(String message, List<String> recipents) async {
    print("Enter");
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
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


                  Center(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      style:
                      const TextStyle(color: Colors.black, fontSize: 15),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        "Pick",
                        "Message to Gita Rani Pal",
                        "Message to Afsana Rahman",
                        "Message to Mousumi Talukdar",
                        //"Message to Jasmin",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.roboto(
                              fontSize: 22.0,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  FlatButton(
                    onPressed: () {
                      String message = "${widget.uname} referred a new patient. Patient Id- ${widget.pid}";
                      if(dropdownValue == 'Message to Gita Rani Pal') {
                        List<String> recipents = ["01730013706"];

                        _sendSMS(message, recipents);
                      }else if(dropdownValue == 'Message to Afsana Rahman'){
                        List<String> recipents = ["01730013705"];

                        _sendSMS(message, recipents);
                      }
                      else if(dropdownValue == 'Message to Mousumi Talukdar'){
                        List<String> recipents = ["01730013709"];

                        _sendSMS(message, recipents);
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Select Sender",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: LinearGradient(
                              colors: [Color(0xff2A4780), Color(0xff2A4780)])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Message",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),



                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => q1(
                                  employee_id: widget.employee_id,
                                  uname: widget.uname)));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(
                              colors: [Color(0xff01652C), Color(0xff01652C)])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Next Patient",
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
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyApp()), (route) => false);
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
