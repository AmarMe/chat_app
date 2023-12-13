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
            number()
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
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "phone number",
                contentPadding: EdgeInsets.all(9),
                hintStyle: TextStyle(letterSpacing: 2),
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
}
