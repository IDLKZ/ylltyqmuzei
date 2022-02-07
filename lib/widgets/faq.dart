import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ylltyqmuzei/models/faqs.dart';
import 'package:ylltyqmuzei/services/api.dart';

class FaqWidget extends StatefulWidget {
  const FaqWidget({Key? key}) : super(key: key);

  @override
  _FaqWidgetState createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  late Future<FaqList> faqs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    faqs = FaqProvider().getFaq();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FaqList>(
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
                                            title: Text(faq.getQuestion(), style: const TextStyle(color: Colors.black),),
                                          );
                                        },
                                        body: ListTile(
                                          title: Text(faq.getAnswer(),style: const TextStyle(color: Colors.black)),
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
    );
  }
}
