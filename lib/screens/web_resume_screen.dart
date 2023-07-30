import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:shimmer/shimmer.dart';

class WResumeScreen extends StatefulWidget {
  const WResumeScreen({Key? key}) : super(key: key);

  @override
  State<WResumeScreen> createState() => _WResumeScreenState();
}
class _WResumeScreenState extends State<WResumeScreen> {
  final PdfViewerController controller = PdfViewerController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return Stack(alignment: Alignment.center, children: [
     (isLoading) ? const CircularProgressIndicator() : Container(),
          AspectRatio(
              aspectRatio: 3 / 4,
              child: PdfViewer.openAsset(
                'assets/pdf/myresume.pdf',
                viewerController: controller,
                params: PdfViewerParams(
                  padding: (widthSize > 800) ? 10 : 20,
                  minScale: 1.0,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
    ]);
  }
}
