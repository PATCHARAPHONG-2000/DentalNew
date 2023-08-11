import 'package:dental_news/utils/utils.dart';
import 'package:dental_news/Firebase/Knowledge.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ViwePDF_Knowledge extends StatefulWidget {
  final PDFDocument pdfDocument;
  final NewKnowledg new_knowledge;
  ViwePDF_Knowledge({
    super.key,
    required this.new_knowledge,
    required this.pdfDocument,
  });

  @override
  State<ViwePDF_Knowledge> createState() => _ViwePDF_KnowledgeState();
}

class _ViwePDF_KnowledgeState extends State<ViwePDF_Knowledge> {
  late NewKnowledg knowledge;

  get pdfDocument => PDFDocument();
  // PDFDocument pdfDocument;

  @override
  void initState() {
    super.initState();
    knowledge = widget.new_knowledge;
    viwepdf();
  }

  Future<Null> viwepdf() async {
    try {
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(knowledge.name),
      ),
      body: PDF().cachedFromUrl(
        knowledge.pdf,
        placeholder: (double progress) => Center(
            child: CircularProgressIndicator(
          color: color.blue,
        )),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
