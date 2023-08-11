import 'package:dental_news/Firebase/Data_Care.dart';
import 'package:dental_news/Home/Dental_Care/Care_Detel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Firebase/FireBase.dart';

class Home_Care extends StatefulWidget {
  const Home_Care({Key? key}) : super(key: key);

  @override
  _Home_CareState createState() => _Home_CareState();
}

class _Home_CareState extends State<Home_Care> {
  List<Widget> widgests = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Care_Data> careDataList = await FireBaseData.readData();
    setState(() {
      widgests = careDataList.map((careData) => creatWidget(careData)).toList();
    });
  }

  Widget creatWidget(Care_Data careData) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  InkWell(
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            careData.image,
                          ),
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        border: Border.all(
                            width: 3, color: Theme.of(context).hoverColor),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 40,
                            width: 400,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(83, 153, 152, 152),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(27),
                                bottomRight: Radius.circular(27),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                careData.name,
                                style: GoogleFonts.k2d(
                                  color: const Color(0xff38023d),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Care_Detel(
                            care: careData,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              // Generated code for this Column Widget...
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          tr('app.Care_teeth'),
          style: GoogleFonts.k2d(),
        ),
      ),
      body: widgests.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).hoverColor,
              ),
            )
          : GridView.extent(
              childAspectRatio: 0.75,
              crossAxisSpacing: 0.1,
              mainAxisSpacing: 0.5,
              maxCrossAxisExtent: 350,
              children: widgests,
            ),
    );
  }
}