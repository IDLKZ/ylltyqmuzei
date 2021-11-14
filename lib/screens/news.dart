import 'package:flutter/material.dart';
import 'package:welcome/mixins/mixins.dart';
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
  int currentPage = 0;
  int lastPage = 1;
  ListNews? allNews;
  ScrollController _scrollController = new ScrollController();
  bool loading = true;
  loadMoreData() async {
    if(currentPage <= lastPage){
      setState(() {
        currentPage++;
        loading = true;
      });
      ListNews rawData = await NewsModelsProvider().getAllNews(currentPage);
      setState(() {
        if(currentPage == 1){
          allNews= rawData;
        }
        else{
          allNews!.listNews.addAll(rawData.listNews);
        }
        loading = false;
        currentPage = rawData.currentPage;
        lastPage = rawData.lastPage;
      });
    }
    else{
      setState(() {
        loading = false;
      });
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreData();
      }
    });
  }

  Widget _buildList() {
    return ListView.builder(
      controller: _scrollController,
        itemCount: allNews!.listNews.length + 1,
        itemBuilder: (context, index) {
          return (index != allNews!.listNews.length) ? Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/singleNews",arguments: allNews!.listNews[index].alias);
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    Mixin().getImage(allNews!.listNews[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(Mixin().truncateText(allNews!.listNews[index].getTitle(), 40)),
                subtitle: Text(allNews!.listNews[index].createdAt),
              ),
            ),
          )
              : (loading == true ? Center(child: CircularProgressIndicator())
              : Center(
                  child: (currentPage <= lastPage ? ElevatedButton(onPressed: (){loadMoreData();}, child: Text("Загрузить"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF0c1e34)))) : SizedBox()),
              )

          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: NavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Text("Все новости", style: TextStyle(fontSize: 30),),
              ),
              SizedBox(height: 10,),
              allNews != null ?
              Expanded(child: _buildList())
                  :Center(child: CircularProgressIndicator(color: Colors.redAccent,),)
            ],
          ),
        ),
      )

    );
  }
}


