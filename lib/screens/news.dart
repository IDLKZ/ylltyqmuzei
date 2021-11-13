import 'package:flutter/material.dart';
import 'package:welcome/models/news.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/widgets/my_appbar.dart';
import 'package:welcome/widgets/nav_bar.dart';



class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int currentPage = 1;
  int lastPage = 1;
  ListNews? allNews;

  loadMoreData()async{
    allNews = await NewsModelsProvider().getAllNews(currentPage);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMoreData();

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
        drawer: NavBar(),
        body: Center(
          child: Text("23"),
        ),

    );
  }
}
