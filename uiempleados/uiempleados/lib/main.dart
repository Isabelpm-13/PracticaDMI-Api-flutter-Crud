import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = 'https://app-apidmi180324.herokuapp.com/';
  List userData = [];

  getEmpleados() async {
    http.Response response = await http.get(Uri.parse(url));
    userData = json.decode(response.body);
    setState(() {
      userData = userData;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmpleados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empleados 180324'),
        backgroundColor: Colors.cyan.shade400,
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.cyan.shade50,
              ),
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "$index",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Text("${userData[index]["nombre"]}"),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "${userData[index]["salario"]}",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
