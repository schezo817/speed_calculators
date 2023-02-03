import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  //入力された距離
  String meters = "";

  //単位:mでの距離
  double reMeters = 0;

  //入力された時間
  String time = "";

  //単位:minでの時間
  double reTime = 0;

  //選択されている距離単位
  String? isSelectedMeters = 'm';

  //選択されている時間単位
  String? isSelectedTime = 'min';

  //表示する秒速
  String secSpeed = "   ";

  //表示する分速
  String minSpeed = "   ";

  //表示する時速
  String hourSpeed = "   ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //背景色
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.lightGreen,
          ),
          Container(
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
                      setState(() {
                        //距離と時間が入力されている時
                        if (!(meters == "" || time == "")) {
                          //距離の変換
                          switch (isSelectedMeters) {
                            case "mm":
                              reMeters = double.parse(meters) / 1000;
                              break;
                            case "cm":
                              reMeters = double.parse(meters) / 100;
                              break;
                            case "km":
                              reMeters = double.parse(meters) * 1000;
                              break;
                            default:
                              reMeters = double.parse(meters);
                              break;
                          }
                          //時間の変換
                          switch (isSelectedTime) {
                            case "sec":
                              reTime = double.parse(time) / 60;
                              break;
                            case "h":
                              reTime = double.parse(time) * 60;
                              break;
                            case "day":
                              reTime = double.parse(time) * 60 * 24;
                              break;
                            default:
                              reTime = double.parse(time);
                              break;
                          }
                          //分速??メートル
                          double speed = reMeters / reTime;
                          //単位ごとの速度に変換
                          secSpeed = (speed / 60).toString();
                          minSpeed = (speed).toString();
                          hourSpeed = (speed * 60 / 1000).toString();
                        }
                      });
                    },
                    child: const Text(
                      "決定",
                    ),
                  ),
                  const Text("\n\n"),
                  Text("秒速 " + secSpeed + "m"),
                  Text("分速 " + minSpeed + "m"),
                  Text("時速 " + hourSpeed + "km"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
