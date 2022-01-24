import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:welcome/constants/constants.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/models/models.dart';
import 'my_appbar.dart';
import 'nav_bar.dart';

class ThirdModelWidget extends StatelessWidget {
  late Future <ModelList> models;
  ThirdModelWidget({required this.models});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5DC),
      appBar: const MyAppBar(),
      drawer: const NavBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: const Alignment(-1, -1),
              child: Card(
                color: Colors.black.withOpacity(0.5),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: const Color(0xfffff6d4),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: FutureBuilder<ModelList>(
                future: models,
                builder: (context, snapshot) {
                  if (!snapshot.hasError) {
                    if (snapshot.hasData) {
                      return snapshot.data!.modelList.isNotEmpty ?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.builder(
                            gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                            itemCount: snapshot.data!.modelList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    Navigator.pushNamed(context, "/model",arguments: snapshot.data!.modelList[index].alias);
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        // height: MediaQuery.of(context).size.height*0.25,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(Mixin().getImage(snapshot.data!.modelList[index].image)),
                                              fit: BoxFit.cover,
                                              // colorFilter: ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
                                            ),
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        // height: MediaQuery.of(context).size.height*0.25,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF000000).withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(snapshot.data!.modelList[index].getTitle(), style: const TextStyle(fontFamily: 'Philosopher', fontSize: 16, color: Constants.kMainColor),),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                          :Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/images/no_data.json'),
                        ],
                      )
                      ;
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.redAccent,
                        ),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );

  }
}
