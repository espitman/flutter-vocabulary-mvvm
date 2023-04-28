import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebViewer extends StatelessWidget {
  final String url;

  WebViewer({required this.url});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 2800, // Adjust the height as needed
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(url),
          ),
        ),
      ),
    );
  }
}