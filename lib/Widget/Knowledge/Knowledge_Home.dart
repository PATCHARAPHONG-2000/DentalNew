import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Firebase/FireBase.dart';
import '../../Firebase/Knowledge.dart';
import 'ViwePDF_Knowledge.dart';

class Knowledge extends StatefulWidget {
  const Knowledge({Key? key}) : super(key: key);

  @override
  State<Knowledge> createState() => _KnowledgeState();
}

class _KnowledgeState extends State<Knowledge> {
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

  Widget knowledgeWidget(NewKnowledg newknowledge) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(newknowledge.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: 120, // กำหนดความกว้างของรูปภาพ
                      height: 170, // กำหนดความสูงของรูปภาพ
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
    return knowledgewidgests.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).hoverColor,
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) =>
                knowledgewidgests[index],
            itemCount: knowledgewidgests.length,
          );
  }
}
