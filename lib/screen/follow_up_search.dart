import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:amader_gram_main/screen/search_data.dart';
import '../main.dart';
import '../model/surveydata.dart';
import 'followassesmentget.dart';
import 'get_all_data.dart';

class Follow_up_search extends StatefulWidget {
  // NotificationList({Key? key}) : super(key: key);

  Follow_up_search({
    required this.employee_id,
    required this.uname,

  });
  //
  // String id;
  String employee_id;
  String uname;

  @override
  _Follow_up_searchState createState() => _Follow_up_searchState();
}

class _Follow_up_searchState extends State<Follow_up_search> {
  String searchid = " ";

  @override
  Future<List<Surveydata>>? futurePost;

  Future<List<Surveydata>> fetchPost() async {
    var response = await http.get(
      Uri.parse('http://agcrcdigitalhealthservices.cloud-ag.net/getdata.php'),
    );

  //  print(response.body);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<Surveydata>((json) => Surveydata.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Icon searchIcon = Icon(Icons.search);
  Widget customSearchBar = Text('Search Patient ID');

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
        child: Scaffold(
          appBar: AppBar(
            title: Text("AGCRC - Digital Health Services"),
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyApp()), (route) => false);
                  },
                  icon: Icon(
                    Icons.login_outlined,
                    color: Colors.black,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Follow Up Patient Search",
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Card(
                    elevation: 5,
                    child: TextField(
                      onChanged: (input) {
                        searchid = input;
                      },
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          hintText: 'Patient ID', border: OutlineInputBorder()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 100,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Get_All_Data(
                                    id: searchid,
                                    role: 'MA',
                                    employee_id: widget.employee_id,
                                    uname: widget.uname,
                                  )));
                    },
                    color: Colors.white,
                    child: Text("Search"),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
