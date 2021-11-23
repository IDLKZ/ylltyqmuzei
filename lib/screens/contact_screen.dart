import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:welcome/constants/constants.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/widgets/my_appbar.dart';
import 'package:welcome/widgets/nav_bar.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var maskFormatter = MaskTextInputFormatter(mask: '+7 (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') });
  @override
  Widget build(BuildContext context) {
    final TextEditingController _name = TextEditingController();
    final TextEditingController _phone = TextEditingController();
    final TextEditingController _message = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,10,30,10),
        child: ListView(
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
            const SizedBox(height: 30,),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person, color: Constants.kMainColor,),
                      hintText: 'contact_form_name_hint'.tr,
                      hintStyle: const TextStyle(color: Constants.kMainColor),
                      labelText: 'contact_form_name_label'.tr,
                      labelStyle: const TextStyle(color: Constants.kMainColor),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'validation_required'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _phone,
                      inputFormatters: [maskFormatter],
                      decoration: InputDecoration(
                        icon: const Icon(Icons.phone, color: Constants.kMainColor,),
                        hintText: 'contact_form_phone_hint'.tr,
                        hintStyle: const TextStyle(color: Constants.kMainColor),
                        labelText: 'contact_form_phone_label'.tr,
                        labelStyle: const TextStyle(color: Constants.kMainColor)
                      ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'validation_required'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _message,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.email, color: Constants.kMainColor,),
                      hintText: 'contact_form_message_hint'.tr,
                      hintStyle: const TextStyle(color: Constants.kMainColor),
                      labelText: 'contact_form_message_label'.tr,
                      labelStyle: const TextStyle(color: Constants.kMainColor)
                    ),
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    minLines: 1,
                    maxLines: 5,
                    maxLength: 150,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'validation_required'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Constants.kMainColor)),
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('processing_data'.tr, textAlign: TextAlign.center), backgroundColor: Constants.kMainColor,),
                        );

                        bool result = await SendFormProvider().sendForm({
                          'name': _name.text,
                          'phone': _phone.text,
                          'message': _message.text
                        });
                        
                        if(result){
                          setState(() {
                            _name.clear();
                            _phone.clear();
                            _message.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('success_message'.tr, textAlign: TextAlign.center,), backgroundColor: Colors.green,),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('error_message'.tr, textAlign: TextAlign.center), backgroundColor: Colors.red,),
                          );
                        }

                      }
                    },
                    child: Text('contact_form_button'.tr),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
