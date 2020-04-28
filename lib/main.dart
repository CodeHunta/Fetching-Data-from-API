import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:userdata/api.dart';
import 'package:userdata/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      body: Card(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 50.0,
                    color: Colors.blueAccent,
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
      body: new Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                color: Colors.blueAccent,
                size: 300.0,
              ),
              SizedBox(height: 25.0),
              new Text(
                'Name: ' + user.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              SizedBox(height: 10.0),
              new Text(
                ' Username: ' + user.username,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              SizedBox(height: 10.0),
              new Text(
                'Email: ' + user.email,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              SizedBox(height: 10.0),
              new Text(
                'Phone: ' + user.phone,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
