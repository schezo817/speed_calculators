import 'dart:ffi';

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
      debugShowCheckedModeBanner: false,
      title: '速度計算機',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '速度計算機'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var meters = "";
  var time = "";
  String? isSelectedMeters = 'm';
  String? isSelectedTime = 'min';
  var secSpeed;
  var minSpeed;
  var hourSpeed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: TextEditingController(text: meters),
                      maxLines: 1,
                      maxLength: 10,
                      style: const TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onChanged: (text) {
                        meters = text;
                      },
                    ),
                  ),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        child: Text('mm'),
                        value: 'mm',
                      ),
                      DropdownMenuItem(
                        child: Text('cm'),
                        value: 'cm',
                      ),
                      DropdownMenuItem(
                        child: Text('m'),
                        value: 'm',
                      ),
                      DropdownMenuItem(
                        child: Text('km'),
                        value: 'km',
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        isSelectedMeters = value;
                      });
                    },
                    value: isSelectedMeters,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: TextEditingController(text: time),
                      maxLines: 1,
                      maxLength: 10,
                      style: const TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onChanged: (text) {
                        time = text;
                      },
                    ),
                  ),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        child: Text('sec'),
                        value: 'sec',
                      ),
                      DropdownMenuItem(
                        child: Text('min'),
                        value: 'min',
                      ),
                      DropdownMenuItem(
                        child: Text('h'),
                        value: 'h',
                      ),
                      DropdownMenuItem(
                        child: Text('day'),
                        value: 'day',
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        isSelectedTime = value;
                      });
                    },
                    value: isSelectedTime,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {

                },
                child: Text(
                  "決定",
                ),
              ),
              Text(
                "秒速"+secSpeed+"m"
              ),
              Text(
                  "分速"+minSpeed+"m"
              ),
              Text(
                  "時速"+hourSpeed+"m"
              ),

            ],
          ),
        ),
      ),
    );
  }

  double _calculator(){
    return 8.8;
  }
}
