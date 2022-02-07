import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ylltyqmuzei/constants/constants.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/services.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/widgets/my_appbar.dart';
import 'package:ylltyqmuzei/widgets/nav_bar.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  int currentPage = 0;
  int lastPage = 1;
  ListServices? allServices;
  ScrollController _scrollController = new ScrollController();
  bool loading = true;

  loadMoreData() async {
    if(currentPage <= lastPage){
      setState(() {
        currentPage++;
        loading = true;
      });
      ListServices rawData = await ServiceProvider().getAllNews(currentPage);
      setState(() {
        if(currentPage == 1){
          allServices = rawData;
        }
        else{
          allServices!.listService.addAll(rawData.listService);
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
        itemCount: allServices!.listService.length + 1,
        itemBuilder: (context, index) {
          return (index != allServices!.listService.length) ? Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/singleServices",arguments: allServices!.listService[index].alias);
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    Mixin().getImage(allServices!.listService[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(Mixin().truncateText(allServices!.listService[index].getTitle(), 40)),
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
                Text("menu_services".tr, style: const TextStyle(fontSize: 30),),
                const SizedBox(height: 10,),
                allServices != null ?
                Expanded(child: _buildList())
                    :const Center(child: CircularProgressIndicator(color: Colors.redAccent,),)
              ],
            ),
          ),
        )

    );
  }
}
