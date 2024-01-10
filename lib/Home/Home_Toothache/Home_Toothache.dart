import 'package:dental_news/Firebase/FireBase.dart';
import 'package:dental_news/Home/Home_Toothache/Toot_Detel.dart';
import 'package:dental_news/utils/utils.dart';
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
        child: Column(
          children: [
            InkWell(
              child: Container(
                width: 400,
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(toothache.image),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: color.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 45,
                      width: 400,
                      decoration: BoxDecoration(
                        color: color.blue,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(17),
                          bottomRight: Radius.circular(17),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0, top: 4.0),
                        child: Text(
                          toothache.name,
                          style: GoogleFonts.k2d(
                            color: color.white,
                            fontSize: 15.0,
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
              childAspectRatio: 0.71,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 0.1,
              maxCrossAxisExtent: 350,
              children: widgests,
            ),
    );
  }
}
