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
  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if(posX == 0){
      center(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: posY,
            left: posX,
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
              onVerticalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  double delta = details.delta.dy;
                  posY += delta;
                });
              },
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(16.0),
        child: Text('Taps: $numTaps - Double Taps: $numDoubleTaps - Long Press: $numLongPress',
        style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }

  void center(BuildContext context){
    posX = (MediaQuery.of(context).size.width / 2) - boxSize /2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize /2 - 30;

    setState(() {
      this.posX = posX;
      this.posY = posY;
    });
  }
  
}
