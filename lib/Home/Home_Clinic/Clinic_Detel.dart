import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:line_icons/line_icons.dart';

import '../../Firebase/Dental_Clinic.dart';

class Clinic_Detel extends StatefulWidget {
  final ClinicFirebase clinicData;

  const Clinic_Detel({
    required this.clinicData,
  });

  @override
  _Clinic_DetelState createState() => _Clinic_DetelState();
}

// ignore: camel_case_types
class _Clinic_DetelState extends State<Clinic_Detel> {
  late ClinicFirebase clini;
  List<Widget> widgests = [];

  @override
  void initState() {
    super.initState();
    clini = widget.clinicData;
    // readData();
    //detelDeata();
  }

  Future<void> _lunchUrl(Uri uri) async {
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw 'Could not lunch $Uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: color.appBar,
      appBar: AppBar(
        title: Text(clini.name),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                LineIcons.directions,
                color: Theme.of(context).cardColor,
              ),
              onPressed: () {
                final Uri uri = Uri.parse(clini.url);
                _lunchUrl(uri);
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(clini.image_1),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    clini.name,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.k2d(
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    tr('app.Address'),
                    style: GoogleFonts.k2d(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      clini.address,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    tr('app.Time'),
                    style: GoogleFonts.k2d(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      clini.time,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    tr('app.Time_Out'),
                    style: GoogleFonts.k2d(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      clini.time_out,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.k2d(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
