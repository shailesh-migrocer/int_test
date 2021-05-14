import 'package:flutter/material.dart';
class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
bool _isLoading = false;
String x='showing text',y='different text';

  void showOverlay() {
    
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = true;
        y="actual text";
      });
    });
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Second Screen'),
    ),
    body: SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                key: Key("show"),
                onPressed: showOverlay,
                child: Text('Show'),
              ),
              _isLoading==false?CircularProgressIndicator():Text(x),
              x==x?Text(y):Text(y),
            ],
          ),
        ),
      ),
    ),
  );
}