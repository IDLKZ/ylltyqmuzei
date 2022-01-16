import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
                  color: Colors.white,
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
                      return snapshot.data!.modelList.length > 0 ?
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
                              return GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, '/model', arguments: snapshot.data!.modelList[index].alias);
                                },
                                child: Card(
                                  elevation:7,
                                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 120,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(Mixin().getImage(snapshot.data!.modelList[index].image)),
                                              )),
                                        ),
                                        Text(
                                          Mixin().truncateText(snapshot.data!.modelList[index].getTitle(), 10),
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                        snapshot.data!.modelList[index].showcase != null ? Text(
                                          snapshot.data!.modelList[index].showcase!.getTitle(),
                                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ) : SizedBox()
                                      ],
                                    ),
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
