import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/tours.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/widgets/my_appbar.dart';
import 'package:ylltyqmuzei/widgets/nav_bar.dart';

class Tours extends StatelessWidget {
  late Future<TourList> tours;

  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String? alias = args.arguments.toString();
    //tours = TourProvider().getToursByHallId(alias);
    String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = new RegExp(pattern);
    bool result = regExp.hasMatch(alias);
    return Scaffold(
      appBar: MyAppBar(),
      body: result
          ? WebView(
        initialUrl: alias,
        javascriptMode: JavascriptMode.unrestricted,
      )
          : const Center(
          child: CircularProgressIndicator(),
      )
      ,
    );
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const NavBar(),
      body: SafeArea(
        child: FutureBuilder<TourList>(
          future: tours,
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.hasData) {
                return
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SafeArea(
                                child: Container(
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
                                )
                            ),
                            Text("3d_tour".tr, style: const TextStyle(
                                fontSize: 30),),
                          ],
                        ),
                      ),
                      snapshot.data!.tours.length > 0 ? Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.tours.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/tour',
                                    arguments: snapshot.data!.tours[index]
                                        .alias);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    image: DecorationImage(
                                      // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                        image: NetworkImage(Mixin().getImage(
                                            snapshot.data!.tours[index].image)),
                                        fit: BoxFit.cover
                                    ),

                                  ),
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  height: 220,
                                  alignment: const Alignment(-0.7, 0.7),
                                  child: Text(
                                    snapshot.data!.tours[index].getTitle(),
                                    style: const TextStyle(fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/images/no_data2.json'),
                        ],
                      ),
                    ],
                  );
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

      ),
    );
  }
}
