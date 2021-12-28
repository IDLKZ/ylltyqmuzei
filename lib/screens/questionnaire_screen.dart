import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:welcome/models/survey.dart';
import 'package:welcome/services/api.dart';
import 'dart:io';

import 'package:welcome/widgets/my_appbar.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({Key? key}) : super(key: key);

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  late Future<SurveyList> surveys;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    surveys = SurveyProvider().getAllSurvey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: FutureBuilder <SurveyList>(
            future: surveys,
            builder: (context,snapshot){
              if(!snapshot.hasError){
                if(snapshot.hasData){
                 return ListView.builder(
                   itemCount: snapshot.data!.surveyList.length,
                   itemBuilder: (context, index) {
                     return GestureDetector(
                       onTap: (){
                         if(snapshot.data!.surveyList[index].getUrl() != null){
                           Navigator.pushNamed(context, '/singleSurvey', arguments: snapshot.data!.surveyList[index].alias);
                         }
                       },
                       child: Card(
                         child: ListTile(
                           leading: Icon(FontAwesomeIcons.questionCircle),
                           title: Text(snapshot.data!.surveyList[index].getTitle(),),
                         ),
                       ),
                     );
                   },
                 );
                }
                else{
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
              else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

            }


        ),
      ),
    );
  }
}
