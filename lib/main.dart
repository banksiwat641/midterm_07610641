import 'package:flutter/material.dart';

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
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var _controller01 = TextEditingController();
  var _controller02 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PIG WEIGHT',
                  style: TextStyle(fontSize: 60.0, color: Colors.pinkAccent),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'CALCULATOR',
                  style:
                      TextStyle(fontSize: 50.0, color: Colors.pinkAccent),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/images/pig.png',
                    width: 300.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 110,

                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(1.0),
                                offset: const Offset(8.0, 5.0),
                                blurRadius: 10.0,
                                spreadRadius: 3.0,
                              ),
                            ]

                        ),
                        child: Column(
                          children: [
                            Text(
                              'LENGTH',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _controller01,
                              ),

                            ),


                          ],



                        ),

                      ),


                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 300,
                          height: 110,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),

                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12.withOpacity(1.0),
                                  offset: const Offset(8.0, 5.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 3.0,
                                ),
                              ]

                          ),

                          child: Column(
                            children: [
                              Text(
                                'GIRTH',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _controller02,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: ElevatedButton(
                      onPressed: () {
                        var input01 = _controller01.text;
                        var input02 = _controller02.text;
                        var weight = 0.0;
                        var length = double.tryParse(input01);
                        var girth = double.tryParse(input02);
                        if (length == null || weight == null) {
                          print(
                              "กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น");
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('ERROR',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                  content: Text('Invalid input'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        } else {
                          double weight = (girth! / 100) *
                              (girth / 100) *
                              (length / 100) *
                              69.3;
                          double price = weight * 112.50;
                          double Tolerance_weight_max =
                              (0.03 * weight) + weight;
                          double Tolerance_price_max = (0.03 * price) + price;
                          double Tolerance_weight_min =
                              weight - (0.03 * weight);
                          double Tolerance_price_min = price - (0.03 * price);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/ic_pig.png',
                                          width: 30, height: 30),
                                      Text('  RESULT'),
                                    ],
                                  ),
                                ),
                                content: Text(
                                    'Weight: ${Tolerance_weight_min.round()} - ${Tolerance_weight_max.round()} kg\nPrice: ${Tolerance_price_min.round()} - ${Tolerance_price_max.round()} Baht'),
                                actions: [
                                  // ปุ่ม OK ใน dialog
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text('CALCULATE')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
