import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/database.dart';
import 'package:hello_world/login.dart';
import 'package:hello_world/student.dart';
import 'package:hello_world/studentlist.dart';

class Register extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _formKey = GlobalKey<FormState>();
  Student _student;
  var _rollcontroller = TextEditingController();
  var _emailcontroller = TextEditingController();
  var _passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              /*Center(
                child: CircleAvatar(
                  radius: 55,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://www.rd.com/wp-content/uploads/2019/11/heart-book.jpg"),
                  ),
                ),
              ),*/
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(
                "Register Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _rollcontroller,
                          decoration: InputDecoration(
                              labelText: "Roll",
                              icon: Icon(Icons.account_circle)),
                          validator: (value) =>
                              (value.isEmpty) ? "Please enter roll number" : null,
                          autofocus: false,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email", icon: Icon(Icons.email)),
                          controller: _emailcontroller,
                          validator: (value) =>
                              (value.isEmpty) ? "Please enter email id" : null,
                          autofocus: false,
                        ),
                        TextFormField(
                          controller: _passcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              icon: Icon(Icons.local_parking)),
                          validator: (value) =>
                              (value.isEmpty) ? "Please enter password" : null,
                          autofocus: false,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text(
                              "Submit Here",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => _onSubmit(),
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          child: Text(
                            "For Login Click Here",
                            style: TextStyle(fontSize: 15),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text(
                              "Show All Student",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentList()),
                            ),
                            color: Colors.black,
                          ),
                        ),
                        /*FutureBuilder(
                          future: DatabaseHelper.databaseHelper.allStudents(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Student> list = snapshot.data;
                              return ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  Student std=list[index];
                                  return Card(
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Roll : ${std.roll}"),
                                         Text("Email : ${std.email}"),
                                       ],
                                     ),
                                  );
                                },
                                itemCount: list == null ? 0 : list.length,
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }

  _onSubmit() async {
    if (_formKey.currentState.validate()) {
      if (_student == null) {
        Student student = Student(
            roll: num.parse(_rollcontroller.text),
            email: _emailcontroller.text,
            pass: _passcontroller.text);
        print(student);
        DatabaseHelper.databaseHelper.insertStudent(_student).then((value) => {
              _rollcontroller.clear(),
              _emailcontroller.clear(),
              _passcontroller.clear(),
              print("Student Added Successfully ${value}")
            });
      }
    }
  }
}
