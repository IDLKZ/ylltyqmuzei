import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:welcome/constants/constants.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/models/news.dart';
import 'package:welcome/models/stocks.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/widgets/my_appbar.dart';
import 'package:welcome/widgets/nav_bar.dart';


class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  int currentPage = 0;
  int lastPage = 1;
  ListStocks? allNews;
  ScrollController _scrollController = new ScrollController();
  bool loading = true;
  loadMoreData() async {
    if(currentPage <= lastPage){
      setState(() {
        currentPage++;
        loading = true;
      });
      ListStocks rawData = await NewsModelsProvider().getAllStock(currentPage);
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
                  Navigator.pushNamed(context, "/singleStocks",arguments: allNews!.listNews[index].alias);
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
              : (loading == true ? const Center(child: CircularProgressIndicator())
              : Center(
            child: (currentPage <= lastPage ? ElevatedButton(onPressed: (){loadMoreData();}, child: Text("load_more".tr),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Constants.kMainColor))) : const SizedBox()),
          )

          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        drawer: const NavBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("all_stocks".tr, style: const TextStyle(fontSize: 30),),
                const SizedBox(height: 10,),
                allNews != null ?
                Expanded(child: _buildList())
                    :const Center(child: CircularProgressIndicator(color: Colors.redAccent,),)
              ],
            ),
          ),
        )

    );
  }
}


