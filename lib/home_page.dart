import 'package:flutter/material.dart';
import 'package:simple_slider/simple_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final _imageUrls = [
    'https://static.thenounproject.com/png/17241-200.png',
    'https://static.thenounproject.com/png/17241-200.png',
    'https://static.thenounproject.com/png/17241-200.png',
    'https://static.thenounproject.com/png/17241-200.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: _myMainPage(context),
      drawer: Drawer(
        child: ListView(
          //remove padding from ListView()
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://static.thenounproject.com/png/17241-200.png')),
                      color: Colors.redAccent,
                    ),
                  ),
                  Text(
                    'Deep Singh',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    'deepsingh44@gmail.come',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("About Me"),
              subtitle: Text("Brief introduction"),
              leading: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Profile"),
              subtitle: Text("Update profile here"),
              leading: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Add Product"),
              subtitle: Text("Add product here"),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text("List of Product"),
              subtitle: Text("Get all products here"),
              leading: Icon(Icons.list),
            ),
            ListTile(
              title: Text("Logout"),
              subtitle: Text("Back to Login page"),
              leading: Icon(Icons.assignment_return),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myMainPage(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.yellow,
              child: Container(
                child: ImageSliderWidget(
                  imageUrls: _imageUrls,
                  imageBorderRadius: BorderRadius.circular(10.0),
                  imageHeight: 8,
                ),
              ),
            ),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Main Menu",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Card(child: Container(width: 100,height: 100,color: Colors.green[100],child: Center(child: Text("A"),),),),
                      Card(child: Container(width: 100,height: 100,color: Colors.green[200],child: Center(child: Text("B"),),),),
                      Card(child: Container(width: 100,height: 100,color: Colors.green[300],child: Center(child: Text("C"),),),),
                      Card(child: Container(width: 100,height: 100,color: Colors.green[400],child: Center(child: Text("D"),),),),
                      Card(child: Container(width: 100,height: 100,color: Colors.green[500],child: Center(child: Text("E"),),),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
