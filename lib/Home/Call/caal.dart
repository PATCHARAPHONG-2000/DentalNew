import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  _personState createState() => _personState();
}

Future<void> _lunchUrl(Uri uri) async {
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalNonBrowserApplication,
  )) {
    throw 'Could not lunch $Uri';
  }
}

class _personState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(LineIcons.chevronCircleLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.map_outlined,
              ),
              onPressed: () {
                final Uri uri =
                    Uri.parse('https://goo.gl/maps/9t8CYvrkfnLx99rLA');
                _lunchUrl(uri);
              },
            ),
          ),
        ],
        title: Text(
          tr("app.call"),
          style: GoogleFonts.k2d(),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'CDEC',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'ศูนย์การศึกษาต่อ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'เนื่องของทันตแพทย์ ทันตแพทยสภา',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'ศ.ป.ท',
                style: TextStyle(fontSize: 60),
              ),
              Text(
                'ศูนย์ประเมินและรับรองความรู้',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'ความสามารถในการประกอบ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'วิชาชีพทันตกรรม',
                style: TextStyle(fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60),
              ),
              Text(
                'ที่อยู่            :   88/19 หมู่ที่ 4 ชั้น5 อาคารสภาวิชาชีพ ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                '                       ซอยสาธารณสุข 8 กระทรวงสาธารณสุข ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                '                       ถนนติวานนท์ ตำบลตลาดขวัญ ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                '                       อำเถอเมือง จังหวัดนนทบุรี 11000',
                style: TextStyle(fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                'Phone        :  02 580 7500 ถึง 3',
                style: TextStyle(fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                'E-mail        :  dent11@dentalcouncil.or.th',
                style: TextStyle(fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                '                   :  cdec_center@yahoo.com',
                style: TextStyle(fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                '                   :  cdec@dentalcouncil.or.th',
                style: TextStyle(fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 17),
              ),
              Text(
                '                   :  cdathai@gmail.com',
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
