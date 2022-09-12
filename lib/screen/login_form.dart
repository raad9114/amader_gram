import 'dart:convert';
import 'package:amader_gram_main/screen/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amader_gram_main/screen/medical_officer.dart';
import 'package:http/http.dart' as http;
import '../../model/login_model.dart';
import '../../screen/getdata.dart';
import 'cooordinator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String zemail = '';
  String xpassword = '';

  bool _obsecureText = true;
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this,
            duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  late LoginModel data;
  gotohomepage() async {
    //print(xpassword);
    final FormState? formState = _formkey.currentState;

    if (formState!.validate()) {
      formState.save();

      var response =
      await http.post(Uri.parse('http://agcrcdigitalhealthservices.cloud-ag.net/login.php'),
          body: jsonEncode(<String, String>{
            "username": zemail,
          }));
      data = loginModelFromJson(response.body);
      print("raad");
      //
      // print(response.body);

      if (zemail == data.username && xpassword == data.password && data.role =='Medical Assistant') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GetData()));
      } else if (zemail == data.username && xpassword == data.password && data.role =='Health Service Coordinator') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Welcome(
                  employee_id: data.employeeId,
                  uname: data.name,
                )));
      } else if (zemail == data.username && xpassword == data.password && data.role =='Doctor' ) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Medical_officer()));
      }else if (zemail == data.username && xpassword == data.password && data.role =='Health Program Supervisor' ) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Coordinator()));
      }else if (zemail == data.username && xpassword == data.password && data.role =='Administrator' ) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Medical_officer()));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Wrong Username/Password ",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    }
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(
        begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 60),
                color: Colors.white,
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('images/ag.png'),
                )),
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    margin: const EdgeInsets.only(
                      right: 70,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 32),
                          child: TextFormField(
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            onChanged: (input) {
                              zemail = input;
                            },
                            validator: (input) {
                              if (input!.isEmpty) {
                                return "Empty";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 20), // add padding to adjust text
                              isDense: false,
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 18,
                              ),
                              labelText: "User Name",
                              labelStyle: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.account_circle,
                                size: 35,
                                color: Color(0xFF05672E),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 32),
                          child: TextFormField(
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            obscureText: _obsecureText,
                            onChanged: (input) {
                              xpassword = input;
                            },
                            validator: (input) {
                              if (input!.isEmpty) {
                                return "Empty";
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 20), // add padding to adjust text
                                isDense: false,
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: 18,
                                ),
                                labelText: "Password",
                                labelStyle: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obsecureText
                                        ? FontAwesomeIcons.solidEyeSlash
                                        : FontAwesomeIcons.solidEye,
                                    color: Color(0xFF05672E),
                                  ),
                                  onPressed: () {
                                    toggle();
                                  },
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green[200]!.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff1bccba),
                            Color(0xff22e2ab),
                          ],
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          gotohomepage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
