import 'package:dental_news/Model/Home_Model.dart';
import 'package:dental_news/Model/drawer_screen.dart';
import 'package:dental_news/Widget/Knowledge/Knowledge.dart';
import 'package:dental_news/Widget/Knowledge/ViwePDF_Knowledge.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import '../Firebase/FireBase.dart';
import '../Firebase/Knowledge.dart';
import '../Model/Chatbot.dart';
import '../Model/ImageSlide.dart';

class HomeSceen extends StatefulWidget {
  final String title;
  const HomeSceen({super.key, required this.title});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPang(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          tr('app.Home'),
          style: GoogleFonts.k2d(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                LineIcons.facebookMessenger,
                color: Theme.of(context).cardColor,
                size: 35,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ChatScreen();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          const SizedBox(
            height: 250,
            child: ImageSlide(),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          const Home_Moddel(),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  tr('app.knowledge_news'),
                  style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 90,
                    height: 35,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          tr('app.View_more'),
                          style: GoogleFonts.k2d(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const NewKnowledge();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            color: Colors.transparent,
            width: 200,
            height: 200,
            child: knowledgewidgests.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).hoverColor,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        knowledgewidgests[index],
                    itemCount: knowledgewidgests.length > 5
                        ? 5
                        : knowledgewidgests.length,
                  ),
          ),
        ],
      ),
    );
  }

  // //Widget Ko
  List<Widget> knowledgewidgests = [];

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
                          fit: BoxFit.cover,
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
}
