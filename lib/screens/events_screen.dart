import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ylltyqmuzei/constants/constants.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/events.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/widgets/my_appbar.dart';
import 'package:ylltyqmuzei/widgets/nav_bar.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  int currentPage = 0;
  int lastPage = 1;
  ListEvents? allEvents;
  ScrollController _scrollController = new ScrollController();
  bool loading = true;

  loadMoreData() async {
    if(currentPage <= lastPage){
      setState(() {
        currentPage++;
        loading = true;
      });
      ListEvents rawData = await EventProvider().getAllEvents(currentPage);
      setState(() {
        if(currentPage == 1){
          allEvents = rawData;
        }
        else{
          allEvents!.listEvent.addAll(rawData.listEvent);
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
        itemCount: allEvents!.listEvent.length + 1,
        itemBuilder: (context, index) {
          return (index != allEvents!.listEvent.length) ? Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/singleEvent",arguments: allEvents!.listEvent[index].alias);
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    Mixin().getImage(allEvents!.listEvent[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(Mixin().truncateText(allEvents!.listEvent[index].getTitle(), 40)),
                subtitle: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: allEvents!.listEvent[index].dateStart,style: TextStyle(color: Colors.black)),
                      TextSpan(text: "-",style: TextStyle(color: Colors.black)),
                      TextSpan(text: allEvents!.listEvent[index].dateEnd,style: TextStyle(color: Colors.black)),
                    ]
                  ),

                ),
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
                Text("events".tr, style: const TextStyle(fontSize: 30),),
                const SizedBox(height: 10,),
                allEvents != null ?
                Expanded(child: _buildList())
                    :const Center(child: CircularProgressIndicator(color: Colors.redAccent,),)
              ],
            ),
          ),
        )

    );
  }
}
