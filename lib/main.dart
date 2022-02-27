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
      title: 'Gesture Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double boxSize = 150.0;
  int numTaps = 0;
  int numDoubleTaps = 0;
  int numLongPress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            setState(() {
              numTaps++;
            });
          },
          onDoubleTap: (){
            numDoubleTaps++;
          },
          onLongPress: (){
           numLongPress++;
          },
          child: Container(
            width: boxSize,
            height: boxSize,
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(16.0),
        child: Text('Taps: $numTaps - Double Taps: $numDoubleTaps - Long Press: $numLongPress',
        style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
  
}
