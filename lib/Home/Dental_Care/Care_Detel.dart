// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dental_news/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dental_news/Firebase/Data_Care.dart';

// ignore: must_be_immutable
class Care_Detel extends StatefulWidget {
  Care_Data care;

  Care_Detel({super.key, required this.care});

  @override
  _Care_DetelState createState() => _Care_DetelState();
}

class _Care_DetelState extends State<Care_Detel> {
  Care_Data? care_data;
  List<Widget> widgests = [];

  @override
  void initState() {
    super.initState();
    care_data = widget.care;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: color.appBar,
      appBar: AppBar(
        title: Text(care_data!.name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(care_data!.image_1),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(care_data!.name, style: k22style),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      tr('app.Details'),
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  care_data!.data,
                  style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
