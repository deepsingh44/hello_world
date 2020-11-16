import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Center(
            child: CircleAvatar(
              radius: 55,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://www.rd.com/wp-content/uploads/2019/11/heart-book.jpg"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Text(
            "Login Details",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email", icon: Icon(Icons.email)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", icon: Icon(Icons.local_parking)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text(
                        "Login Here",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    child: Text(
                      "For Register Click Here",
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
