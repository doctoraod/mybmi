import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBMIScreen extends StatefulWidget {
  final String name;
  final String gender;

  const MyBMIScreen({Key? key, required this.name, required this.gender})
      : super(key: key);

  @override
  State<MyBMIScreen> createState() => _MyBMIScreenState();
}

class _MyBMIScreenState extends State<MyBMIScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  double bmi = 0.0;

  double CalculateBMI(h, w) {
    double height = double.parse(h) / 100;
    double weight = double.parse(w);
    // We dived height by 100 because we are taking the height in centimeter
    // and formula takes height in meter.

    double heightSquare = height * height;
    double result = weight / heightSquare;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MY BMI"),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green.shade300,
                    child: Row(children: [
                      Text(
                        "Hello " + widget.name,
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        widget.gender == 'man' ? Icons.man : Icons.woman,
                        size: 40,
                      )
                    ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.always,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: const InputDecoration(
                        hintText: 'Weight (KG.)',
                        labelText: 'Weight',
                        border: OutlineInputBorder()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter weight';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: height,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.always,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: const InputDecoration(
                        hintText: 'Height (cm.)',
                        labelText: 'Height',
                        border: OutlineInputBorder()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter height';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          Theme.of(context).primaryColor, // <-- Button color
                      onPrimary: Colors.white, // <-- Splash color
                    ),
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                        double re = CalculateBMI(height.text, weight.text);
                        print(re);
                        setState(() {
                          bmi = re;
                        });
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                  child: Text(bmi.toString()),
                ),
              ],
            )));
  }
}
