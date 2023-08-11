import 'package:dental_news/Firebase/FireBase.dart';
import 'package:dental_news/Firebase/Press_release.dart';
import 'package:dental_news/Widget/Press_release/ViwePDF_Press_release.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class Press_release extends StatefulWidget {
  const Press_release({super.key});

  @override
  State<Press_release> createState() => _Press_releaseState();
}

class _Press_releaseState extends State<Press_release> {
  List<Widget> widgests = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Pressrelease> careDataList = await FireBaseData.pressreleaseData();
    setState(() {
      widgests = careDataList.map((careData) => creatWidget(careData)).toList();
    });
  }

  Widget creatWidget(Pressrelease fireBasePress) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ViwePDF_PressRelease(
                              pdfDocument: PDFDocument(),
                              fire_BasePress: fireBasePress,
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(20)),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        fireBasePress.image,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        fireBasePress.name,
                        style: GoogleFonts.k2d(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(tr('app.Press_release')),
        leading: IconButton(
          icon: Icon(LineIcons.chevronCircleLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: widgests.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).hoverColor,
              ),
            )
          : GridView.extent(
              childAspectRatio: 0.57,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 0.1,
              maxCrossAxisExtent: 350,
              children: widgests,
            ),
    );
  }
}
