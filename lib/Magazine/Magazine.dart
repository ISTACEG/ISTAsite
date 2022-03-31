import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MagazinePage extends StatefulWidget {
  final String file_url;
  const MagazinePage({Key? key, required this.file_url}) : super(key: key);

  @override
  _MagazinePageState createState() => _MagazinePageState();
}

class _MagazinePageState extends State<MagazinePage> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: width,
        height: height,
        child: SfPdfViewer.asset(widget.file_url,
            controller: _pdfViewerController, key: _pdfViewerStateKey),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _pdfViewerController.zoomLevel =
                    _pdfViewerController.zoomLevel + 0.25;
              },
              icon: Icon(
                Icons.zoom_in,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                _pdfViewerController.zoomLevel =
                    _pdfViewerController.zoomLevel - 0.25;
              },
              icon: Icon(
                Icons.zoom_out,
                color: Colors.white,
              ))
        ],
      ),
    ));
  }
}
