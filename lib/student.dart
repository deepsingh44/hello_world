class Student{
  int roll;
  String email;
  String pass;
  Student({this.roll,this.email,this.pass});

  Map<String,dynamic> toMap(){
    return {"roll":roll,"email":email,"pass":pass};
  }

  Student.fromMap(dynamic obj) {
    this.email = obj['email'];
    this.pass = obj['pass'];
    this.roll=obj['roll'];
  }

  @override
  String toString() {
    return 'Student{roll: $roll, name: $email, age: $pass}';
  }

}