import 'package:flutter/material.dart';
import 'package:hello_world/database.dart';
import 'package:hello_world/student.dart';

class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List Here"),
      ),
      body: ListData(),
    );
  }
}

// ignore: must_be_immutable
class ListData extends StatelessWidget {
  List<Student> _list;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    //students.then((value) => _list=value);
    return Container(
      child: FutureBuilder(
        future: DatabaseHelper.databaseHelper.allStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _list = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Student std = _list[index];
                return Card(
                  child: Container(
                    child: ListTile(
                      title: Text("Roll : ${std.roll}"),
                      subtitle: Text("Email : ${std.email}"),
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _edit(std),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _delete(std),
                      ),
                    ),
                  ),
                );
              },
              itemCount: _list == null ? 0 : _list.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  //edit student here
  _edit(Student student) {
    //create alert box here
    _showAlertDialog(context, student);
  }

  //delete student from here
  _delete(Student student) {
    print("${student.roll} delete this");
    DatabaseHelper.databaseHelper.deleteStudent(student.roll).then((value) => {
          _list.remove(student),
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Successfully Deleted'))),
        });
  }

  _showAlertDialog(BuildContext context, Student student) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Edit Student"),
      //increase height automatic of column components
      content: IntrinsicHeight(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (value) => student.roll = num.parse(value),
                decoration: InputDecoration(labelText: "Roll"),
                initialValue: student.roll.toString(),
              ),
              TextFormField(
                onChanged: (value) => student.email = value,
                decoration: InputDecoration(labelText: "Email"),
                initialValue: student.email,
              ),
              TextFormField(
                onChanged: (value) => student.pass = value,
                obscureText: false,
                initialValue: student.pass,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: FlatButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () => {
                    DatabaseHelper.databaseHelper
                        .updateStudent(student)
                        .then((value) => {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Successfully Update'))),
                              Navigator.pop(context),
                            }),
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
