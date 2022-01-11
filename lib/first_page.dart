import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late PdfViewerController _PdfViewerController;

  @override
  void initState() {
    _PdfViewerController = PdfViewerController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SfPdfViewer.asset(
          'assets/resume_yoon.pdf',
          controller: _PdfViewerController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: FloatingActionButton(
                  child: const Icon(Icons.zoom_in),
                  onPressed: () {
                    _PdfViewerController.zoomLevel = 1.50;
                  }),
            ),
            const SizedBox(width: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: FloatingActionButton(
                  child: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        )
      ],
    ));
  }
}
