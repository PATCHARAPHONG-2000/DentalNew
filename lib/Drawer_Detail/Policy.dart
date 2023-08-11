//นโยบายทันตแพทยสภา
import 'package:dental_news/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class Policy extends StatefulWidget {
  const Policy({Key? key}) : super(key: key);

  @override
  _PolicyState createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          tr('PDC.Policy_Dental_Council'),
          style: GoogleFonts.k2d(),
        ),
        leading: IconButton(
          icon: Icon(LineIcons.chevronCircleLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tr('PDC.Policy_Dental_Council'),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Divider(
                color: color.grey,
                thickness: 1,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Text(
                tr('PDC.PDC1'),
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                  fontSize: 25,
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Column(
                  children: [
                    Image.asset(
                      "image/image88.jpg",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Text(
                      tr('PDC.PDC2'),
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Text(
                      tr('PDC.PDC3'),
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Text(
                      tr('PDC.PDC4'),
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Divider(
                color: color.grey,
                thickness: 1,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Text(
                tr('PDC.PDC5'),
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                  fontSize: 25,
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Text(
                tr('PDC.PDC6'),
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                  fontSize: 17,
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 150),
              Text(
                tr('PDC.PDC7'),
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                  fontSize: 17,
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 150),
              Text(
                tr('PDC.PDC8'),
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                  fontSize: 17,
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 150),
              Text(
                tr('PDC.PDC9'),
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                  fontSize: 17,
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 150),
              Text(
                tr('PDC.PDC10'),
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                  fontSize: 17,
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 150),
              Text(
                tr('PDC.PDC11'),
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                  fontSize: 17,
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 150),
              Text(
                tr('PDC.PDC12'),
                style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                  fontSize: 17,
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
