import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:welcome/models/survey.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/widgets/my_appbar.dart';

class SurveyScreen extends StatelessWidget {
  late Future<Survey> survey;

  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    survey = SurveyProvider().getSingleSurvey(alias);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children:[

            FutureBuilder<Survey>(
              future: survey,
              builder: (context,snapshot){
                if(!snapshot.hasError){
                  if(snapshot.hasData){
                    return WebView(
                      initialUrl: snapshot.data!.getUrl(),
                      javascriptMode: JavascriptMode.unrestricted,
                    );
                  }
                  else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },


            ),
            Container(
              alignment: const Alignment(-1, -1),
              child: Card(
                color: Colors.black.withOpacity(0.5),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,

                ),
              ),
            ),
          ]

        ),
      ),
    );
  }
}
