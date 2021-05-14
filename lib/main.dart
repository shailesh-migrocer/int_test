import 'package:flutter/material.dart';

import 'SecondScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: MyHomePage(title: 'Counter App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int inc_counter = 0, dec_counter=0;

  void _incrementCounter() {
    setState(() {
      inc_counter++;
    });
  }
  void _decrementCounter(){
    setState(() {
      dec_counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              key: Key('increment'),
              child: Text('Increment'),
              color: Colors.blueAccent,
              textColor: Colors.white,onPressed: _incrementCounter
            ),
            Text("$inc_counter"),
            FlatButton(
              key: Key('decrement'),
              child: Text('Decrement'),
              color: Colors.blueAccent,
              textColor: Colors.white,onPressed: _decrementCounter
            ),
            Text("$dec_counter"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key("SecondScreen"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyStatefulWidget()),
            );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
