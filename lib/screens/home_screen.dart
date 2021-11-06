import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        backgroundColor: const Color(0xff57240e),
      ),
      body: Mixin().isConnected() ?
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff57240e),
                Color(0xffff6628),
              ],
            )
        ),
        child: FutureBuilder<HallList>(
          future: halls,
          builder: (context, snapshot){
            if(!snapshot.hasError){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.halls.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [HallDetailCard(hall: snapshot.data!.halls[index],)],
                      );
                    }
                );
              } else {
                return const Center(child: CircularProgressIndicator(color: Colors.white,),);
              }
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      )
      :const Center(
        child: Card(
          color: Colors.redAccent,
          child: Text("Подключение к интернету отсутствует!",style: TextStyle(color: Colors.white),),
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

