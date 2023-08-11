import 'package:dental_news/utils/utils.dart';
import 'package:dental_news/Firebase/Press_release.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ViwePDF_PressRelease extends StatefulWidget {
  final PDFDocument pdfDocument;
  final Pressrelease fire_BasePress;
  const ViwePDF_PressRelease({
    super.key,
    required this.fire_BasePress,
    required this.pdfDocument,
  });

  @override
  State<ViwePDF_PressRelease> createState() => _ViwePDF_PressReleaseState();
}

class _ViwePDF_PressReleaseState extends State<ViwePDF_PressRelease> {
  Pressrelease? fireBasePress;

  get pdfDocuments => PDFDocument();

  @override
  void initState() {
    super.initState();
    fireBasePress = widget.fire_BasePress;
    viwepdf();
  }

  Future<Null> viwepdf() async {
    try {
      var result = await PDFDocument.fromURL(fireBasePress!.pdf);
      setState(() {
        // ignore: unused_local_variable
        var pdfDocument = result;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fireBasePress!.name),
      ),
      body: Container(
        height: double.infinity,
        child: PDF(
          fitEachPage: true,
          defaultPage: 0,
          enableSwipe: true,
          pageFling: true,
          pageSnap: true,
        ).cachedFromUrl(
          fireBasePress!.pdf,
          placeholder: (double progress) =>
              Center(child: CircularProgressIndicator(color: color.blue)),
          errorWidget: (dynamic error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
