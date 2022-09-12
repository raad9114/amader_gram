// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../model/getData_followupModel.dart';
// import '../model/search_by_id.dart';
// import 'package:http/http.dart' as http;
//
// import 'assistant.dart';
// import 'follow_up_assesment.dart';
// class Get_Assesment_Data extends StatefulWidget {
//   // const SearchData({Key? key}) : super(key: key);
//
//   Get_Assesment_Data({
//     required this.id,
//     required this.role,
//     required this.employee_id,
//     required this.uname,});
//   String id;
//   String role;
//   String employee_id;
//   String uname;
//
//
//   @override
//   State<Get_Assesment_Data> createState() => _Get_Assesment_DataState();
// }
//
// class _Get_Assesment_DataState extends State<Get_Assesment_Data> {
//   String searchid = " ";
//
//   @override
//   Future<List<GetDataFollowupModel>>? futurePost;
//
//   Future<List<GetDataFollowupModel>> fetchPost() async {
//     var response = await http.post(
//         Uri.parse('http://agcrcdigitalhealthservices.cloud-ag.net/getData_followup.php'),
//         body: jsonEncode(<String, String>{
//           "pid": widget.id,
//         }));
//
//     print(response.body);
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed
//           .map<GetDataFollowupModel>((json) => GetDataFollowupModel.fromJson(json))
//           .toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     futurePost = fetchPost();
//     fetchPost();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: (){
//                   Navigator.pop(context);
//                 },
//                 color: Colors.black),
//             title: Text("AGCRC - Digital Health Services"),
//             //automaticallyImplyLeading: false,
//             centerTitle: true,
//           ),
//           body: SingleChildScrollView(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 15),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 1.25,
//                     child: FutureBuilder<List<GetDataFollowupModel>>(
//                       future: futurePost,
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           return ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: snapshot.data!.length,
//                             itemBuilder: (_, index) => Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Patient ID: " +
//                                       "${snapshot.data![index].pid}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "1. Name: " +
//                                       "${snapshot.data![index].pname}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "2. Date of consultation: " +
//                                       "${snapshot.data![index].doc}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "3. Sex: " + "${snapshot.data![index].sex}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "4. Membership: " +
//                                       "${snapshot.data![index].membership}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "5. Date of Birth: " +
//                                       "${snapshot.data![index].dob}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "6. Address: " +
//                                       "${snapshot.data![index].address}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "7. Mobile: " +
//                                       "${snapshot.data![index].mobile}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "8. Marital Status: " +
//                                       "${snapshot.data![index].maritalStatus}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "9. Number of Children: " +
//                                       "${snapshot.data![index].noChild}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "10. Height: " +
//                                       "${snapshot.data![index].height}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "11. Weight: " +
//                                       "${snapshot.data![index].weight}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "12. Pulse: " +
//                                       "${snapshot.data![index].pulse}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "13. Blood Pressure: " +
//                                       "${snapshot.data![index].systolic}" +
//                                       " / " +
//                                       "${snapshot.data![index].diastolic}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "14. Diabetic: " +
//                                       "${snapshot.data![index].diabeticStatus}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "15. Major Complain: "
//                                       "${snapshot.data![index].complainOfDay}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "16. Observation By Medical Assistant: " +
//                                       "${snapshot.data![index].observationMa}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "17. Suggestion By Medical Assistant: " +
//                                       "${snapshot.data![index].suggestionMa}" ,
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "18. Schedule For VC: " +
//                                       "${snapshot.data![index].sheduleVc}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "19. Suggestion By Medical Officer: "
//                                       "${snapshot.data![index].suggestionMo}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Text(
//                                   "20. Created By: "
//                                       "${snapshot.data![index].uname}",
//                                   style: GoogleFonts.lato(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                 ),
//
//                                 if(widget.role == 'MO')...[
//
//                                 ]else if(widget.role == 'MA')...[
//                                   Center(
//                                     child: RaisedButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     Follow_UP_Assesment(
//                                                       employee_id: widget.employee_id,
//                                                       uname: widget.uname,
//                                                       pname: widget.pname,
//                                                       address: widget.address,
//                                                       mobile: widget.mobile,
//                                                       maritalStatus: widget.maritalStatus,
//                                                       nochild: widget.numberchild,
//                                                       height: widget.height,
//                                                       sex: widget.sex,
//                                                       member: widget.member,
//                                                       dob: widget.dob,
//                                                       pid: widget.pid,
//                                                       pstatus: widget.pstatus,)));
//                                       },
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(80.0)),
//                                       textColor: Colors.white,
//                                       padding: const EdgeInsets.all(0),
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         height: 50.0,
//                                         width: MediaQuery.of(context).size.width *
//                                             0.5,
//                                         decoration:  BoxDecoration(
//                                             borderRadius:
//                                             BorderRadius.circular(80.0),
//                                             gradient:  LinearGradient(colors: [
//                                               Color.fromARGB(255, 255, 136, 34),
//                                               Color.fromARGB(255, 255, 177, 41)
//                                             ])),
//                                         padding: const EdgeInsets.all(0),
//                                         child: Text(
//                                           "Assesment",
//                                           textAlign: TextAlign.center,
//                                           style: GoogleFonts.roboto(
//                                             fontSize: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ]
//
//
//
//                               ],
//                             ),
//                           );
//                         } else if (snapshot.hasError) {
//                           return Text('${snapshot.error}');
//                         }
//
//                         // By default, show a loading spinner.
//                         return Image(
//                           image: AssetImage('images/aggif.gif'),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
