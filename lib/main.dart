import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:userdata/api.dart';
import 'package:userdata/models/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Client Details',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: UsersListScreen(),
    );
  }
}

class UsersListScreen extends StatefulWidget {
  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("CLIENT DETAILS"),
        centerTitle: true,
      ),
      body: Card(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(
                    Icons.account_box,
                    size: 65.0,
                    color: Color(0xFF262D60),
                  ),
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                          settings: RouteSettings(
                            arguments: users[index],
                          ),
                        ));
                  });
            }),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    throw UnimplementedError();
    final User user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("CLIENT DETAILS"),
        centerTitle: true,
      ),
      body: new Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.person,
                color: Color(0xFF262D60),
                size: 300.0,
              ),
              SizedBox(height: 10.0),
              new Text(
                'Name: ' + user.name,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(height: 10.0),
              new Text(
                ' Username: ' + user.username,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
              ),
              SizedBox(height: 10.0),
              new Text(
                'Email: ' + user.email,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
              ),
              SizedBox(height: 10.0),
              new Text(
                'Phone: ' + user.phone,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
