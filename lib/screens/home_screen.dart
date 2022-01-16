import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:welcome/constants/constants.dart';
import 'package:welcome/models/halls.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/widgets/faq.dart';
import 'package:welcome/widgets/my_appbar.dart';
import 'package:welcome/widgets/nav_bar.dart';
import 'package:welcome/widgets/qr.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<HallList> halls;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    halls = HallProvider().getHall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      drawer: const NavBar(),
      body: CurvedNavBar(
        actionButton: CurvedActionBar(
            activeIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
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
        navBarBackgroundColor: Constants.kMainColor,
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
              text: 'bottom_main'.tr),
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
                color: Color(0xfffaf5ec),
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
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),
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
          const FaqWidget()
        ],
        actionBarView: const QrWidget(),
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
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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

