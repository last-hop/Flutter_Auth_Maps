import 'package:flutter/material.dart';
import 'package:flutter_auth_maps/home.dart';
import 'package:hexcolor/hexcolor.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: HexColor("#4285F4")), // Add border
            borderRadius: BorderRadius.circular(10),
          ),
          width: 350, // Set the width of the container
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate to the previous screen
                    },
                    icon: Icon(Icons.close), // Add cross icon
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Enter your OTP you received to",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(first: true, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: true),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle resend OTP
                          },
                          child: Text(
                            "RESEND OTP",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#00509D"),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#4285F4"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        minimumSize: Size(double.infinity, 0), // Full width
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>HomeScreen()),
                        );
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white, // Set background color to white
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "By Clicking on Button",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: HexColor("#00509D")),
              ),
              Text(
                " you are agree to Reaching’s, Disclaimers,",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: HexColor("#00509D")),
              ),
              Text(
                "Privacy Policy and Terms & Conditions.",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: HexColor("#00509D"), decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 60,
      width: 45,
      decoration: BoxDecoration(

        color: Color(0xFFEBEBEB), // Set background color
        borderRadius: BorderRadius.circular(12),
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(

            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
               borderSide: BorderSide(width: 2, color: Colors.purple),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
