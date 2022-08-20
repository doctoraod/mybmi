import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var gender;
  TextEditingController name = TextEditingController();
  @override
  Color calculateGender(input) {
    if (input == 'man') {
      return gender == 'man' ? Colors.blue : Colors.blue.withOpacity(0.5);
    }
    return gender == 'woman' ? Colors.red : Colors.red.withOpacity(0.5);
  }

  void onChangeGender(input) {
    setState(() {
      gender = input;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MY BMI"),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      labelText: 'Name',
                      border: OutlineInputBorder()),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 3) {
                      return 'length must more than 3 characters';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 0.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          this.onChangeGender('man');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: this.calculateGender('man'),
                              borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                          child: const Icon(
                            Icons.man,
                            size: 60,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          this.onChangeGender('woman');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: this.calculateGender('woman'),
                              borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                          child: Icon(
                            Icons.woman,
                            size: 60,
                          ),
                        ),
                      )
                    ],
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
                        print(name.text);
                        print(gender);
                      }
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
