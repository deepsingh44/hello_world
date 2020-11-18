import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Button Tutorial",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Button Demo"),
        ),
        body: myButtonWidget(context),
      )
    );
  }
}

Widget myButtonWidget(BuildContext context){
  return Container(
    color: Colors.redAccent,
    width: MediaQuery.of(context).size.width,
    child: FlatButton(
      child: Text("Click Me"),
      onPressed: (){},
    ),
  );
}
