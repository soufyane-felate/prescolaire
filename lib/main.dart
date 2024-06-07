import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var nomController = TextEditingController();
  var prnomController = TextEditingController();
  var dateController = TextEditingController();
  String? vle = "";
  bool check = false;
  double price = 0.0;

  void calculer() {
    try {
      DateTime? birthDate =
          DateFormat('dd/MM/yyyy').parseStrict(dateController.text);
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }
      if (age >= 1 && age <= 3) {
        if (vle == "ocp") {
          if (check) {
            price = 150.0;
          } else {
            price = 80;
          }
        }
        if (vle == "fm6") {
          if (check) {
            price = 100.0;
          } else {
            price = 70;
          }
        }
        if (vle == "one") {
          if (check) {
            price = 110.0;
          } else {
            price = 75;
          }
        }
      }
      if (age >= 3 && age <= 5) {
        if (vle == "ocp") {
          if (check) {
            price = 250.0;
          } else {
            price = 180;
          }
        }
        if (vle == "fm6") {
          if (check) {
            price = 200.0;
          } else {
            price = 170;
          }
        }
        if (vle == "one") {
          if (check) {
            price = 210.0;
          } else {
            price = 175;
          }
        }
      }
    } catch (e) {
      print("Invalid date format: $e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 230, 230),
          title: Text("test1"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: nomController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        hintText: "nom de l'enfant"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: prnomController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Prenom de l'enfant",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        hintText: "Date de naissance de l'enfant"),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Text("Convention : "),
                      Text("OCP"),
                      Expanded(
                        child: Radio(
                          value: "ocp",
                          groupValue: vle,
                          onChanged: (value) {
                            setState(() {
                              vle = value!;
                            });
                          },
                        ),
                      ),
                      Text("FM6"),
                      Expanded(
                        child: Radio(
                            value: "fm6",
                            groupValue: vle,
                            onChanged: (value) {
                              setState(() {
                                vle = value;
                              });
                            }),
                      ),
                      Text("ONE"),
                      Expanded(
                        child: Radio(
                          value: "one",
                          groupValue: vle,
                          onChanged: (value) {
                            setState(() {
                              vle = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Transport"),
                    Checkbox(
                        value: check,
                        onChanged: (value) {
                          setState(() {
                            check = value!;
                          });
                        })
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      calculer();
                    },
                    child: Text("Calculer")),
                Text("${price.toStringAsFixed(2)} DH"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
