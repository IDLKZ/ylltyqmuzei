import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:welcome/models/halls.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/mixins/mixins.dart';
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
      appBar: AppBar(
        leading: const Icon(Icons.qr_code),
        title: const Text('TIMA'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: const Icon(Icons.language_rounded),
              onPressed: (){}
              )
            ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
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
                                print('ok');
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
      )
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

