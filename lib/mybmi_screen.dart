import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

List bmiSuggestions = [
  {
    "text": "<18.5",
    "image": "assets/images/under_weight.png",
    "suggest":
        "A BMI of under 18.5 indicates that a person has insufficient weight, so they may need to put on some weight. They should ask a doctor or dietitian for advice."
  },
  {
    "text": "18.5-24.9",
    "image": "assets/images/normal.png",
    "suggest":
        "A BMI of 18.5–24.9 indicates that a person has a healthy weight for their height. By maintaining a healthy weight, they can lower their risk of developing serious health problems."
  },
  {
    "text": "25–29.9",
    "image": "assets/images/over_weight.png",
    "suggest":
        "A BMI of 25–29.9 indicates that a person is slightly overweight. A doctor may advise them to lose some weight for health reasons. They should talk with a doctor or dietitian for advice."
  },
  {
    "text": ">30.0",
    "image": "assets/images/obese.png",
    "suggest":
        "A BMI of over 30 indicates that a person has obesity. Their health may be at risk if they do not lose weight. They should talk with a doctor or dietitian for advice."
  },
];
process(double bmi) {
  if (bmi < 18.5) {
    return bmiSuggestions[0];
  } else if (bmi < 25) {
    return bmiSuggestions[1];
  } else if (bmi < 30) {
    return bmiSuggestions[2];
  }
  return bmiSuggestions[3];
}

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
                Visibility(
                  visible: bmi == 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Container(
                          child: Text("test"),
                        ),
                        Container(
                          child: Image.asset(
                            process(bmi)['image'],
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
