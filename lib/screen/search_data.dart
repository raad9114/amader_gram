import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/search_by_id.dart';
import 'package:http/http.dart' as http;

import 'assistant.dart';

class SearchData extends StatefulWidget {
  // const SearchData({Key? key}) : super(key: key);

  SearchData({required this.id, required this.role});
  String id;
  String role;

  @override
  State<SearchData> createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  String searchid = " ";
  bool hasError = false;

  @override
  Future<List<SearchById>>? futurePost;

  Future<List<SearchById>> fetchPost() async {
    var response = await http.post(
        Uri.parse(
            'http://agcrcdigitalhealthservices.cloud-ag.net/getdatabyid.php'),
        body: jsonEncode(<String, String>{
          "pid": widget.id,
        }));

   // print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<SearchById>((json) => SearchById.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
    fetchPost();
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
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 15),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.25,
                    child: FutureBuilder<List<SearchById>>(
                      future: futurePost,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Patient ID: " +
                                      "${snapshot.data![index].id}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "1. Name: " +
                                      "${snapshot.data![index].pname}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "2. Mother's Name: " +
                                      "${snapshot.data![index].mothername}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "3. Date of consultation: " +
                                      "${snapshot.data![index].doc}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "4. Gender: " +
                                      "${snapshot.data![index].sex}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "5. Membership: " +
                                      "${snapshot.data![index].membership}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "6. Date of Birth: " +
                                      "${snapshot.data![index].dob}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "7. Address: " +
                                      "${snapshot.data![index].address}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "8. Mobile: " +
                                      "${snapshot.data![index].mobile}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "9. Marital Status: " +
                                      "${snapshot.data![index].maritalStatus}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "10. Number of Children: " +
                                      "${snapshot.data![index].noChild}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "11. Height: " +
                                      "${snapshot.data![index].height}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "12. Weight: " +
                                      "${snapshot.data![index].weight}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "13. Pulse: " +
                                      "${snapshot.data![index].pulse}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "14. Blood Pressure: " +
                                      "${snapshot.data![index].systolic}" +
                                      " / " +
                                      "${snapshot.data![index].diastolic}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "15. Diabetic: " +
                                      "${snapshot.data![index].diabeticStatus} "
                                          " ${snapshot.data![index].diabeticvalue}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "16. Major Complain: "
                                  "${snapshot.data![index].complainOfDay}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "17. Observations By Medical Assistant: "
                                  "${snapshot.data![index].observationMa}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "18. Suggestions By Medical Assistant: "
                                  "${snapshot.data![index].suggestionMa}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "19. Voice Chat: "
                                  "${snapshot.data![index].sheduleVc}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "20. Suggestion from Medical Officer: "
                                  "${snapshot.data![index].suggestionMo}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "21. Comments From Councilor : "
                                  "${snapshot.data![index].councilor}",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                if (widget.role == 'MO')
                                  ...[]
                                else if (widget.role == 'MA' ||
                                    widget.role == 'Medical Assistant' &&
                                        index + 1 == snapshot.data!.length &&
                                        !snapshot.hasError) ...[
                                  Center(
                                    child: RaisedButton(
                                      onPressed: () {
                                     // print(widget.id);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    assistantwork(
                                                      id: widget.id,
                                                    )));
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.0)),
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: new BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(80.0),
                                            gradient:
                                                new LinearGradient(colors: [
                                              Color.fromARGB(255, 255, 136, 34),
                                              Color.fromARGB(255, 255, 177, 41)
                                            ])),
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          "Consult",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ] else if (widget.role ==
                                        'Health Program Supervisor' &&
                                    index + 1 == snapshot.data!.length &&
                                    !snapshot.hasError) ...[
                                  Center(
                                    child: RaisedButton(
                                      onPressed: () {
                                      //  print(widget.id);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    assistantwork(
                                                      id: widget.id,
                                                    )));
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.0)),
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: new BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(80.0),
                                            gradient:
                                                new LinearGradient(colors: [
                                              Color.fromARGB(255, 255, 136, 34),
                                              Color.fromARGB(255, 255, 177, 41)
                                            ])),
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          "Consult",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Image(
                            image: AssetImage('images/nodata.png'),
                          );
                        }

                        // By default, show a loading spinner.
                        return Image(
                          image: AssetImage('images/aggif.gif'),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
