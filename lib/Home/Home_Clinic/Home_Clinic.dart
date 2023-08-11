import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_news/Firebase/Dental_Clinic.dart';
import 'package:dental_news/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Firebase/FireBase.dart';
import 'Clinic_Detel.dart';

class Home_Clinic extends StatefulWidget {
  const Home_Clinic({Key? key}) : super(key: key);

  @override
  _Home_ClinicState createState() => _Home_ClinicState();
}

class _Home_ClinicState extends State<Home_Clinic> {
  TextEditingController? _searchControll;
  bool _isSearching = false;
  List<Widget> widgests = [];
  List _allResults = [];
  List _resultList = [];
  List<Widget> widgets = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchControll = TextEditingController();
    clinicData();
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    searchResultList();
  }

  searchResultList() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var clientSnapshot in _allResults) {
        var name = clientSnapshot['name'].toString().toLowerCase();
        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(clientSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('Dental_Clinic')
        .orderBy('name')
        .get();

    setState(() {
      _allResults = data.docs;
    });

    searchResultList();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchControll!.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
  }

  Future<void> clinicData() async {
    List<ClinicFirebase> clinicDataList = await FireBaseData.clinicData();
    setState(() {
      widgests =
          clinicDataList.map((clinicData) => createWidget(clinicData)).toList();
    });
  }

  Widget createWidget(ClinicFirebase clinic) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Clinic_Detel(
                    clinicData: clinic,
                  );
                },
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                tileMode: TileMode.clamp,
                colors: [
                  Theme.of(context).cardColor,
                  Theme.of(context).primaryColor,
                ],
                stops: const [0, 1],
                begin: const AlignmentDirectional(0.1, 3.2),
                end: const AlignmentDirectional(-0.3, 0.6),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(5),
              ),
              border: Border.all(
                width: 1,
                color: Theme.of(context).hoverColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clinic.name,
                    style: GoogleFonts.k2d(
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: Divider(
                      endIndent: 250,
                      thickness: 1.0,
                      color: color.white,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Text(
                        "เวลาเปิด :",
                        style: GoogleFonts.k2d(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 67.2),
                        child: Text(
                          clinic.time,
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.k2d(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                    child: Divider(
                      endIndent: 200,
                      thickness: 1.0,
                      color: color.white,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Text(
                        "เวลาปิด :",
                        style: GoogleFonts.k2d(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 67.2),
                        child: Text(
                          clinic.time_out,
                          style: GoogleFonts.k2d(
                            textStyle: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).cardColor,
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
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _isSearching
            ? CupertinoSearchTextField(
                controller: _searchController,
                itemColor: Theme.of(context).cardColor,
                style: TextStyle(color: Theme.of(context).cardColor),
              )
            : Text(
                tr('app.Clinic'),
                style: GoogleFonts.k2d(),
              ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              if (_isSearching) {
                _stopSearch();
              } else {
                _startSearch();
              }
            },
          ),
        ],
      ),
      body: _resultList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).hoverColor,
              ),
            )
          : ListView.builder(
              itemCount: _resultList.length,
              itemBuilder: (BuildContext context, int index) {
                ClinicFirebase clinicData = ClinicFirebase(
                  name: _resultList[index]['name'],
                  address: _resultList[index]['address'],
                  time: _resultList[index]['time'],
                  image_1: _resultList[index]['image_1'],
                  search: _resultList[index]['search'],
                  time_out: _resultList[index]['time_out'],
                  url: _resultList[index]['url'],
                );

                return createWidget(clinicData);
              },
            ),
    );
  }
}
