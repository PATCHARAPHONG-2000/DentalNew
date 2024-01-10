import 'package:dental_news/Firebase/Knowledge.dart';
import 'package:dental_news/Widget/Knowledge/ViwePDF_Knowledge.dart';
import 'package:dental_news/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../../Firebase/FireBase.dart';

class NewKnowledge extends StatefulWidget {
  const NewKnowledge();

  @override
  State<NewKnowledge> createState() => _NewKnowledgeState();
}

class _NewKnowledgeState extends State<NewKnowledge> {
  List<Widget> knowledgewidgests = [];
  // สร้างอินสแตนซ์ของคลาส NewKnowledge

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<NewKnowledg> careDataList = await FireBaseData.knowledgData();
    setState(() {
      knowledgewidgests = careDataList
          .map((newKnowledg) => knowledgeWidget(newKnowledg))
          .toList();
    });
  }

  Widget knowledgeWidget(NewKnowledg newknowledge) {
    return Center(
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
                          return ViwePDF_Knowledge(
                            new_knowledge: newknowledge,
                            pdfDocument: PDFDocument(),
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    //margin: EdgeInsets.only(left: 5.0, top: 5.0),
                    width: 400,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(newknowledge.image),
                      ),
                      border: Border.all(
                        width: 2.0,
                        color: Theme.of(context).hoverColor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white60,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 40,
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
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 7,
                            ),
                            child: Text(
                              newknowledge.name,
                              overflow: TextOverflow.ellipsis,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          tr('app.knowledge'),
          style: GoogleFonts.k2d(),
        ),
        leading: IconButton(
          icon: Icon(LineIcons.chevronCircleLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: knowledgewidgests.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).hoverColor,
              ),
            )
          : GridView.extent(
              childAspectRatio: 0.51,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 0.1,
              maxCrossAxisExtent: 350,
              children: knowledgewidgests,
            ),
    );
  }
}
