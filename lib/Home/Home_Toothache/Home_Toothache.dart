import 'package:dental_news/Firebase/FireBase.dart';
import 'package:dental_news/Home/Home_Toothache/Toot_Detel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Firebase/Toothache.dart';

class Home_Toothache extends StatefulWidget {
  const Home_Toothache({Key? key}) : super(key: key);

  @override
  _Home_ToothacheState createState() => _Home_ToothacheState();
}

class _Home_ToothacheState extends State<Home_Toothache> {
  List<Widget> widgests = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Toothache> toothacheDataList = await FireBaseData.toothacheData();
    setState(() {
      widgests =
          toothacheDataList.map((toothache) => creatWidget(toothache)).toList();
    });
  }

  Widget creatWidget(Toothache toothache) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Stack(
          children: [
            Column(
              children: [
                InkWell(
                  child: Container(
                    //margin: EdgeInsets.only(left: 5.0, top: 5.0),
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(toothache.image),
                      ),
                      border: Border.all(
                        width: 3,
                        color: Theme.of(context).hoverColor,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white60,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 30,
                          width: 400,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(160, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, left: 10),
                            child: Text(
                              toothache.name,
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
                        builder: (BuildContext context) =>
                            Toothache_Detel(toothache: toothache),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            // Generated code for this Column Widget...
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          tr('app.toothache'),
          style: GoogleFonts.k2d(),
        ),
      ),
      // ignore: unrelated_type_equality_checks
      body: widgests.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).hoverColor,
              ),
            )
          : GridView.extent(
              childAspectRatio: 0.76,
              // crossAxisSpacing: 0.1,
              // mainAxisSpacing: 0.5,
              maxCrossAxisExtent: 350,
              children: widgests,
            ),
    );
  }
}
