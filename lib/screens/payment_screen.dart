import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/widgets/my_appbar.dart';
import 'package:ylltyqmuzei/widgets/nav_bar.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.now();
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const NavBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Lottie.asset('assets/images/cards.json'),
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text('requisites'.tr, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold,),),
                      const SizedBox(height: 30,),
                      Table(
                        // border: TableBorder.all(),
                        children: const [
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Наименование:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('РЕСПУБЛИКАНСКОЕ ГОСУДАРСТВЕННОЕ КАЗЕННОЕ ПРЕДПРИЯТИЕ "НАЦИОНАЛЬНЫЙ МУЗЕЙ РЕСПУБЛИКИ КАЗАХСТАН" МИНИСТЕРСТВА КУЛЬТУРЫ И СПОРТА РЕСПУБЛИКИ КАЗАХСТАН'),
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('БИН:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('130740011046'),
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Адрес:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Юридический адрес Г.НУР-СУЛТАН, РАЙОН АЛМАТЫ, ПРОСПЕКТ ТАУЕЛСІЗДІК, 54'),
                            ),
                          ]),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
