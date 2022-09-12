import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:amader_gram_main/screen/search_data.dart';
import '../model/get_data_model.dart';
import '../model/searchmodel.dart';
import '../model/surveydata.dart';

class Coordinator extends StatefulWidget {
  //const NotificationList({Key? key}) : super(key: key);

  // GetData({required this.id});
  //
  // String id;

  @override
  _CoordinatorState createState() => _CoordinatorState();
}

class _CoordinatorState extends State<Coordinator> {

  String searchid = " ";

  @override
  Future<List<GetSurveydataModel>>? futurePost;

  Future<List<GetSurveydataModel>> fetchPost() async {
    var response = await http.get(
      Uri.parse('http://agcrcdigitalhealthservices.cloud-ag.net/getdata.php'),
    );

   // print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<GetSurveydataModel>((json) => GetSurveydataModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }





  Icon searchIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search Patient ID');

  @override
  void initState() {
    super.initState();

    // submitData();
    futurePost = fetchPost();

    fetchPost().whenComplete(() => futurePost);
  }
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            appBar: AppBar(
              title: Text("AGCRC - Digital Health Services"),
              automaticallyImplyLeading: false,
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.login_outlined,
                      color: Colors.black,
                    )
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        ),

                        Container(
                          width: 200,

                          child: TextField(
                            onChanged: (input) {
                              searchid = input;
                            },
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                hintText: 'Patient ID',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 100,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) =>
                                  SearchData(id: searchid,role: 'MO',)));
                            },
                            color: Colors.white,
                            child: Text("Search"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.25,
                      child: FutureBuilder<List<GetSurveydataModel>>(
                        future: futurePost,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Patient ID: " +
                                            "${snapshot.data![index].pid}",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "1. Name: " +
                                            "${snapshot.data![index].pname}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "2. Date of consultation: " +
                                            "${snapshot.data![index].doc}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "3. Gender: " + "${snapshot.data![index].sex}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "4. Membership: " +
                                            "${snapshot.data![index].membership}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "5. Date of Birth: " +
                                            "${snapshot.data![index].dob}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "6. Address: " +
                                            "${snapshot.data![index].address}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "7. Mobile: " +
                                            "${snapshot.data![index].mobile}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "8. Marital Status: " +
                                            "${snapshot.data![index].maritalStatus}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "9. Number of Children: " +
                                            "${snapshot.data![index].noChild}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "10. Height: " +
                                            "${snapshot.data![index].height}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "11. Weight: " +
                                            "${snapshot.data![index].weight}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "12. Pulse: " +
                                            "${snapshot.data![index].pulse}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "13. Blood Pressure: " +
                                            "${snapshot.data![index].systolic}" +
                                            " / " +
                                            "${snapshot.data![index].diastolic}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "14. Diabetic: " +
                                            "${snapshot.data![index].diabeticStatus} " " ${snapshot.data![index].diabeticvalue}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "15. Major Complain: "
                                            "${snapshot.data![index].complainOfDay}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "16. Observation of Medical Officer: "
                                            "${snapshot.data![index].suggestionMo}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),

                                      Text(
                                        "17. Suggestion of Medical Assistant: "
                                            "${snapshot.data![index].suggestionMa}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "18. Schedule: "
                                            "${snapshot.data![index].sheduleVc}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "19. Suggestion Medical Officer: "
                                            "${snapshot.data![index].suggestionMo}",
                                        style: GoogleFonts.lato(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('No Data Available Currently');
                            //   Image(
                            //   image: AssetImage('images/nodata.gif'),
                            // );
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
      ),
    );
  }
}
