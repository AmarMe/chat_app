import 'package:chat_app/Newscreen/login_page.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome to Whatsapp',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),

              //background image
              Image.asset(
                "assets/landingBg.png",
                color: Colors.tealAccent[700],
                height: 300,
                width: 300,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),

              //bottom terms and conditions text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          TextSpan(
                              text: 'Agree and Continue to accept the ',
                              style: TextStyle(
                                color: Colors.grey[600],
                              )),
                          TextSpan(
                              text:
                                  'Whatsapp Terms of Service and Privacy Policy',
                              style: TextStyle(color: Colors.cyan[600])),
                        ])),
              ),
              SizedBox(height: 40),

              //accept and continue button
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (builder) => LoginPage()),
                      (route) => false);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 150,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 6,
                    color: Colors.greenAccent[700],
                    child: Center(
                        child: Text(
                      'Accept and Continue',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
