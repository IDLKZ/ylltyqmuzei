import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:ylltyqmuzei/constants/constants.dart';
import 'package:ylltyqmuzei/models/halls.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/widgets/faq.dart';
import 'package:ylltyqmuzei/widgets/my_appbar.dart';
import 'package:ylltyqmuzei/widgets/nav_bar.dart';
import 'package:ylltyqmuzei/widgets/qr.dart';
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
      backgroundColor: Colors.transparent,
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
        navBarBackgroundColor: Constants.kHeaderColor,
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
                      child: ListView.builder(
                        itemCount: snapshot.data!.halls.length,
                        itemBuilder: (BuildContext context, int index){
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                Navigator.pushNamed(context, "/hall",arguments: snapshot.data!.halls[index].alias);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.25,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(Mixin().getImage(snapshot.data!.halls[index].image)),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
                                        ),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    height: MediaQuery.of(context).size.height*0.25,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF000000).withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(snapshot.data!.halls[index].getTitle(), style: const TextStyle(fontFamily: 'Philosopher', fontSize: 24, color: Constants.kMainColor),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
//                         child: Column(
//                           children: <Widget>[
//                             Expanded(
//                               child: ,
// //                               child: VerticalCardPager(
// //                                   titles: Mixin().getTitle(snapshot.data!.halls),
// // // required
// //                                   images: Mixin().getImages(snapshot.data!.halls),
// // // required
// //                                   textStyle: const TextStyle(
// //                                       color: Colors.white,
// //                                       fontSize: 30,
// //                                       fontWeight: FontWeight.bold,
// //                                       fontFamily: 'Philosopher'
// //                                   ),
// // // optional
// //                                   onPageChanged: (page) {
// //                                   },
// //                                   onSelectedItem: (index) {
// //                                     Navigator.pushNamed(context, "/hall",arguments: snapshot.data!.halls[index].alias);
// //                                   },
// //                                   initialPage: 3,
// // // optional
// //                                   align: ALIGN.CENTER // optional
// //                               ),
//                             ),
//                           ],
//                         ),
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

