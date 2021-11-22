import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/widgets/my_appbar.dart';
import 'package:welcome/widgets/nav_bar.dart';

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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/credit_card.png')
                  )
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text('requisites'.tr, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, fontFamily: 'Lobster'),),
                      const SizedBox(height: 30,),
                      Table(
                        // border: TableBorder.all(),
                        children: const [
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Банк получатель:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('АО "Евразийский Банк"'),
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('РНН:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('582100003432'),
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('ИИК (KZT):', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('KZ 9894815KZT22032170'),
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('ИИК (USD):', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('KZ 9894815USD22032170'),
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('ИИК (RUB):', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('KZ 9894815RUB22032170'),
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('БИК:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('EURIKZKA'),
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Код:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('16'),
                            ),
                          ]),
                          TableRow( children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('БИН:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('990240005557'),
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
