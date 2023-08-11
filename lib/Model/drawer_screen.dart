import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dental_news/Widget/Knowledge/Knowledge.dart';
import 'package:dental_news/Widget/Press_release/press%20release.dart';
import 'package:dental_news/Widget/knowledge_link.dart';

import '../Drawer_Detail/History.dart';
import '../Drawer_Detail/Policy.dart';

class DrawerPang extends StatefulWidget {
  const DrawerPang({super.key});

  @override
  State<DrawerPang> createState() => _DrawerPangState();
}

class _DrawerPangState extends State<DrawerPang> {
  //

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("image/Drawer-BackEnd.png"),
                ),
              ),
              child: null,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Row(
                      children: [
                        Text(
                          tr('app.Dental_Council'),
                          style: GoogleFonts.k2d(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              //color: color.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Theme.of(context).splashColor,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const History();
                          },
                        ),
                      );
                    },
                    title: Text(
                      tr('His.HisH'),
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                    leading: Image.asset(
                      'image/streamline.png',
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const Policy();
                          },
                        ),
                      );
                    },
                    title: Text(
                      tr('PDC.Policy_Dental_Council'),
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                    leading: Image.asset(
                      'image/pen.png',
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          tr('app.Public_Relations'),
                          style: GoogleFonts.k2d(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              //color: color.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Theme.of(context).splashColor,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const Press_release();
                          },
                        ),
                      );
                    },
                    title: Text(
                      tr('app.Press_release'),
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                    leading: Image.asset(
                      'image/mic.png',
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const NewKnowledge();
                          },
                        ),
                      );
                    },
                    title: Text(
                      tr('app.knowledge_news'),
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                    leading: Image.asset(
                      'image/book.png',
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const KnowledgeLink();
                          },
                        ),
                      );
                    },
                    title: Text(
                      tr('app.knowledge_link'),
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                    leading: Image.asset(
                      'image/link.png',
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
