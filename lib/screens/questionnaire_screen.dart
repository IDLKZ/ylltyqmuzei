import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

import 'package:welcome/widgets/my_appbar.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSetqD0-q9ODAEwCltVOBkg294UlDy2kaiE63B78S7EXxQNglA/viewform?usp=sf_link',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
