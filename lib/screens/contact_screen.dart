import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:welcome/widgets/my_appbar.dart';
import 'package:welcome/widgets/nav_bar.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,10,30,10),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text('contact_form'.tr, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, fontFamily: 'Lobster'),),
                  const SizedBox(height: 30,),
                  Table(
                    // border: TableBorder.all(),
                    children: [
                      TableRow( children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('address'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('просп. Тауелсиздик 54, Нур-Султан 010000'),
                        ),
                      ]),
                      TableRow( children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('work_time'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('10:00–18:00'),
                        ),
                      ]),
                      TableRow( children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('phone'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('8 (7172) 91 90 35'),
                        ),
                      ]),
                      TableRow( children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('discovery'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('2014'),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
