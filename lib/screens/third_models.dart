import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ThirdModels extends StatefulWidget {
  const ThirdModels({Key? key}) : super(key: key);

  @override
  _ThirdModelsState createState() => _ThirdModelsState();
}

class _ThirdModelsState extends State<ThirdModels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          child: WebView(
            initialUrl: "https://jitsi.idl.kz/model3d/ortaly-kire-beris-atrium",
            javascriptMode: JavascriptMode.unrestricted,

          )),
    );
  }
}
