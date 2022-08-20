import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}

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
                color: Color.fromARGB(95, 0, 0, 0),
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 0.0, left: 20.0, right: 20.0),
                child: Text(
                  "Health is the grestest gift, contentment the greatest wealth, faithfulness the best relationship.",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(95, 0, 0, 0),
              padding: EdgeInsets.only(
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
                    primary: Colors.pink.shade200, // <-- Button color
                    onPrimary: Colors.white, // <-- Splash color
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.arrow_forward),
                )
              ]),
            ),
            // ###  Test
            // child: Row(children: [
            //   Text(
            //     "BMI",
            //     style: GoogleFonts.roboto(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 24,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            //   TextButton(
            //     style: ElevatedButton.styleFrom(
            //       shape: CircleBorder(),
            //       padding: EdgeInsets.all(20),
            //       primary: Colors.pink.shade200, // <-- Button color
            //       onPrimary: Colors.black, // <-- Splash color
            //     ),
            //     onPressed: () {},
            //     child: Icon(Icons.arrow_forward),
            //   ),
            // ])),
          ]))
    ]));
  }
}
