import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPscreen extends StatefulWidget {
  const OTPscreen({super.key, required this.number, required this.countrycode});
  final String number;
  final String countrycode;

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Verify ${widget.countrycode} ${widget.number}",
          style: const TextStyle(color: Colors.teal),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                    text: "we have sent an SMS with a code to ",
                    style: TextStyle(color: Colors.black, fontSize: 14.5),
                  ),
                  TextSpan(
                    text: widget.countrycode + " " + widget.number,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " wrong number? ",
                    style: TextStyle(color: Colors.cyan[800], fontSize: 14.5),
                  ),
                ])),
            SizedBox(
              height: 15,
            ),
            OTPTextField(
                controller: otpController,
                length: 5,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: TextStyle(fontSize: 17),
                // onChanged: (pin) {
                //   print("Changed: " + pin);
                // },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                }),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Enter 6-digit code',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            bottomTextbuttons(Icons.message, "Resend SMS"),
            Divider(
              thickness: 1.5,
              height: 40,
            ),
            bottomTextbuttons(Icons.call, "Call me"),
          ],
        ),
      ),
    );
  }

  Widget bottomTextbuttons(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.teal,
          size: 25,
        ),
        SizedBox(
          width: 40,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
