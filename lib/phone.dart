import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_auth_maps/otp.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController phoneController = TextEditingController(); // Declare TextEditingController
  var phone =""; // Declare phone variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 100, left: 15, right: 15),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: HexColor("#00509D")),
              ),
              Image.asset(
                'assets/login.png',
                width: 300,
                height: 300,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: HexColor("#4285F4")), // Add border
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 55,
                      width: 320,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: HexColor("#4285F4")), // Add border
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/phoneSym.png',
                            width: 40, // Adjust size as needed
                            height: 40, // Adjust size as needed
                          ),

                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              // controller: phoneController, // Assign the controller
                              onChanged: (value) {
                                // Update the phone variable when text changes
                                setState(() {
                                  phone = value;
                                });
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Mobile Number",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height : 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor("#4285F4"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '+91${phone}', // Use the phone variable
                            verificationCompleted: (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId, int? resendToken) {},
                            codeAutoRetrievalTimeout: (String verificationId) {},
                          );

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) =>Otp()),
                          // );
                        },
                        child: const Text(
                          "Login Using OTP",
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height : 80,
              ),
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
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: HexColor("#00509D"),decoration: TextDecoration.underline),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
