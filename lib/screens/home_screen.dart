import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:welcome/models/faqs.dart';
import 'package:welcome/models/halls.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/widgets/my_appbar.dart';
import 'package:welcome/widgets/nav_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<HallList> halls;
  late Future<FaqList> faqs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    halls = HallProvider().getHall();
    faqs = FaqProvider().getFaq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      drawer: NavBar(),
      body: CurvedNavBar(
        actionButton: CurvedActionBar(
            onTab: (value) {
              /// perform action here
              print(value);
            },
            activeIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Icon(
                Icons.qr_code_scanner,
                size: 50,
                color: Colors.orange,
              ),
            ),
            inActiveIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration:
              const BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
              child: const Icon(
                Icons.qr_code_scanner,
                size: 50,
                color: Colors.white,
              ),
            ),
            text: 'QR'
        ),
        activeColor: Colors.white,
        navBarBackgroundColor: const Color(0xFF0c1e34),
        inActiveColor: Colors.white70,
        appBarItems: [
          FABBottomAppBarItem(
              activeIcon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              inActiveIcon: const Icon(
                Icons.home,
                color: Colors.white70,
              ),
              text: 'Главная'),
          FABBottomAppBarItem(
              activeIcon: const Icon(
                Icons.help_outline,
                color: Colors.white,
              ),
              inActiveIcon: const Icon(
                Icons.help_outline,
                color: Colors.white70,
              ),
              text: 'F.A.Q'),
        ],
        bodyItems: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white

            ),
            child: FutureBuilder<HallList>(
              future: halls,
              builder: (context, snapshot){
                if(!snapshot.hasError){
                  if(snapshot.hasData){

                    return SafeArea(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: VerticalCardPager(
                                titles: Mixin().getTitle(snapshot.data!.halls),
// required
                                images: Mixin().getImages(snapshot.data!.halls),
// required
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Lobster",
                                    fontSize: 10),
// optional
                                onPageChanged: (page) {

                                },
                                onSelectedItem: (index) {
                                  Navigator.pushNamed(context, "/hall",arguments: snapshot.data!.halls[index].alias);
                                },
                                initialPage: 3,
// optional
                                align: ALIGN.CENTER // optional
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator(color: Colors.red,),);
                  }
                } else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          ),
          FutureBuilder<FaqList>(
            future: faqs,
              builder: (context, snapshot){
                if(!snapshot.hasError){
                  if(snapshot.hasData){
                    return SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('F.A.Q', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: snapshot.data!.faqs.map((faq) {
                                    return Container(
                                        margin: const EdgeInsets.all(10),
                                        color: Colors.green,
                                        child: ExpansionPanelList(
                                          animationDuration: const Duration(milliseconds: 1000),
                                          children: [
                                            ExpansionPanel(
                                              headerBuilder: (context, bool isExpanded) {
                                                return ListTile(
                                                  title: Text(faq.questionRu, style: const TextStyle(color: Colors.black),),
                                                );
                                              },
                                              body: ListTile(
                                                title: Text(faq.answerRu,style: const TextStyle(color: Colors.black)),
                                              ),
                                              isExpanded: faq.expanded,
                                              canTapOnHeader: true,
                                            ),
                                          ],
                                          dividerColor: Colors.grey,
                                          expansionCallback: (panelIndex, isExpanded) {
                                            setState(() {
                                              faq.expanded = !faq.expanded;
                                            });
                                          },

                                        )
                                    );
                                  }).toList(),
                                ),
                              )
                          )
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator(color: Colors.redAccent,),);
                  }
                } else {
                  return const Center(child: CircularProgressIndicator(color: Colors.redAccent,),);
                }
              }
          )
        ],
        actionBarView: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.orange,
        ),
      ),
    );
  }
}

class HallDetailCard extends StatelessWidget{
  final Hall hall;

  const HallDetailCard({Key? key, required this.hall}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 50.0,
      margin: const EdgeInsets.fromLTRB(18, 10, 18, 10),
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color: Colors.white),
                  image:  DecorationImage(
                      image:NetworkImage(Mixin().getImage(hall.image)),
                      fit: BoxFit.cover
                  ),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 8,
                        color: Colors.grey,
                        offset: Offset(0,3)
                    )
                  ]
              ),
            ),
            const SizedBox(width: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    hall.titleRu,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

