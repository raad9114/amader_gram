import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import 'package:http/http.dart' as http;


class Sign_up_form extends StatefulWidget {
  const Sign_up_form({Key? key}) : super(key: key);

  @override
  _Sign_up_formState createState() => _Sign_up_formState();
}

class _Sign_up_formState extends State<Sign_up_form> {
  int _activeStepIndex = 0;

  String username = " ";
  String email = " ";
  String password = " ";
  String employee_id = " ";
  String designation = " ";
  String name = " ";


  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  register()async{

    final formstate = formkey.currentState;

    if(formstate!.validate()){
      formstate.save();
      var response = await http.post(Uri.parse('http://agcrcdigitalhealthservices.cloud-ag.net/register.php'),
          body: jsonEncode(<String, String>{
            "name":username,
            "password" :password,
            "designation":designation,
            "email":email,
            "username": username,
            "employee_id":employee_id,
          }));

      if(response.statusCode == 200){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyApp()));
      }

      print(response.body);
    }
    

    
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Sign Up Details',
            style: GoogleFonts.roboto(
              fontSize: 22.0,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          //backgroundColor: Colors.lightGreen,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formkey,
              child: Container(
              //  color: Colors.grey[100],
                //height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Employee ID',
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
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(

                        validator: (input){
                          if(input!.isEmpty){
                            return "Input Required";
                          }
                        },
                        
                        onChanged: (input){
                          employee_id = input;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder()),
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'User Name',
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
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (input){
                          if(input!.isEmpty){
                            return "Input Required";
                          }
                        },
                        onChanged: (input){
                          username = input;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder()),
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Name',
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
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (input){
                          if(input!.isEmpty){
                            return "Input Required";
                          }
                        },
                        onChanged: (input){
                          name = input;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder()),
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Email',
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
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (input){
                          if(input!.isEmpty){
                            return "Input Required";
                          }
                        },
                        onChanged: (input){
                          email = input;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          //hintText: "Diastolic",
                            border: OutlineInputBorder(
                            )),
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Password',
                      style: GoogleFonts.roboto(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (input){
                          if(input!.isEmpty){
                            return "Input Required";
                          }
                        },
                        onChanged: (input){
                          password= input;
                        },
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder()),
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Designation',
                      style: GoogleFonts.roboto(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (input){
                          if(input!.isEmpty){
                            return "Input Required";
                          }
                        },
                        onChanged: (input){
                          designation = input;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder()),
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),


                    const SizedBox(
                      height: 10,
                    ),

                    Center(
                      child: RaisedButton(
                        onPressed: () {
                          register();
                          print("object");
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: 200,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: new LinearGradient(colors: [
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
