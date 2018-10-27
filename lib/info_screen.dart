import 'package:flutter/material.dart';

void main() {
  runApp(InfoScreen());
}


class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Location"),
          ),
          body: Column(
            children: <Widget>[
              Icon(Icons.accessibility),
              Text("Information about the Location above"),
              IconButton(
                icon: Icon(Icons.directions),
                onPressed: null,
              )
            ],
          ),
        ));
  }
}
