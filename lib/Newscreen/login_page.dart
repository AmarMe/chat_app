import 'package:chat_app/Newscreen/OTP_screen.dart';
import 'package:chat_app/Newscreen/country_page.dart';
import 'package:chat_app/model/countrymodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  String countryname = "India";
  String countrycode = "+91";
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Enter your phone number',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.teal,
            wordSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body:
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (builder) => CountryPage(
          //                   setcountrydata: setcountrydata,
          //                 )));
          //   },
          Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text('Whatsapp will send an sms to verify your number',
                style: TextStyle(fontSize: 15)),
            SizedBox(
              height: 5,
            ),
            Text(
              'what\'s my number',
              style: TextStyle(fontSize: 12.5, color: Colors.cyan[800]),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CountryPage(
                                setcountrydata: setcountrydata,
                              )));
                },
                child: Countrycard()),
            SizedBox(
              height: 15,
            ),
            number(),
            SizedBox(
              height: 15,
            ),
            //Next button
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                if (_textEditingController.text.length < 10) {
                  showNumDialogerrornum1();
                } else if (_textEditingController.text.length > 10) {
                  showNumDialogerrornum2();
                } else {
                  showNumDialog();
                }
              },
              child: Container(
                height: 40,
                width: 70,
                color: Colors.teal,
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
      // ),
    );
  }

  Widget Countrycard() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.teal, width: 1.5))),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  countryname,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget number() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      padding: EdgeInsets.symmetric(vertical: 6),
      height: 38,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.teal, width: 1.5))),
            child: Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Text(
                  "+",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(countrycode.substring(1), style: TextStyle(fontSize: 16))
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.5 - 100,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.teal, width: 1.5))),
            child: TextFormField(
              controller: _textEditingController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "phone number",
                contentPadding: EdgeInsets.all(9),
                hintStyle: TextStyle(letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setcountrydata(Countrymodel countrymodel) {
    setState(() {
      countryname = countrymodel.name.toString();
      countrycode = countrymodel.code.toString();
    });
    Navigator.pop(context);
  }

  //Digalogue box if total phone numbers less than 10 or 0
  Future<void> showNumDialogerrornum1() {
    return showDialog(
        context: context,
        builder: (BuildContext cotext) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'There is no number Or less than 10 numbers',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  //Digalogue box if total phone numbers More than 10
  Future<void> showNumDialogerrornum2() {
    return showDialog(
        context: context,
        builder: (BuildContext cotext) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This field must contain only 10 numbers',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  Future<void> showNumDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext cotext) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'We will be verifying your phone Number',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(countrycode + "  " + _textEditingController.text,
                      style: TextStyle(fontSize: 13)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('is this ok, or would you like to edit the number?',
                      style: TextStyle(fontSize: 14))
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('edit')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => OTPscreen(
                                  number: _textEditingController.text,
                                  countrycode: countrycode,
                                )));
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }
}
