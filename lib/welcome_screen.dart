import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'info_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blue,
          child: Image.asset(
            "assets/images/bmi_women.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          )),
      Positioned(
          bottom: 0,
          child: Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(95, 0, 0, 0),
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 0.0, left: 20.0, right: 20.0),
                child: Text(
                  "Health is the greatest gift, contentment the greatest wealth, faithfulness the best relationship.",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(95, 0, 0, 0),
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
              alignment: Alignment.bottomRight,
              child: Row(children: [
                const Spacer(),
                Text(
                  "BMI",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    primary: Theme.of(context).primaryColor, // <-- Button color
                    onPrimary: Colors.white, // <-- Splash color
                  ),
                  onPressed: () {
                    print("test");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InfoScreen();
                    }));
                  },
                  child: const Icon(Icons.arrow_forward),
                )
              ]),
            ),
          ]))
    ]));
  }
}
