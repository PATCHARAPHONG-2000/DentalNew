import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Usermanual extends StatefulWidget {
  const Usermanual({super.key});

  @override
  State<Usermanual> createState() => _UsermanualState();
}

class _UsermanualState extends State<Usermanual> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/pdf/usermanual.pdf');

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(tr('app.ManualTitle')),
        leading: IconButton(
          icon: Icon(LineIcons.chevronCircleLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(
                  document: document,
                  lazyLoad: false,
                  zoomSteps: 1,
                  numberPickerConfirmWidget: const Text(
                    "Confirm",
                  ),
                )),
    );
  }
}
