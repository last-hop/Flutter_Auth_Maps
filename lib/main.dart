import 'package:flutter/material.dart';
import 'package:flutter_auth_maps/phone.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimaryScreen(),
    );
  }
}

class PrimaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/logo.png')),
                SizedBox(height: 20),
                Text(
                  'Ensure Smiles When Reached!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
          Positioned(
            bottom: 100, // Adjust this value to move the button further down
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: HexColor("#4285F4"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyPhone()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 100),
                    Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 100.0), // Adjust the padding as needed
                      child: Image(
                        image: AssetImage('assets/arrowR.png'),
                        width: 24, // Adjust the size as needed
                        height: 24, // Adjust the size as needed
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
