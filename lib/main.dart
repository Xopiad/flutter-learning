import 'package:flutter/material.dart';

import './member_manager.dart';
import './dialogs.dart';
import './sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          accentColor: Colors.deepPurple),
      home: new MyHomePage(title: "Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dialogs dialogs = new Dialogs();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.green,
            accentColor: Colors.deepPurple),
        home: Scaffold(
          appBar: AppBar(
            title: Text("AppBar"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.account_box),
                onPressed: () => dialogs.information(
                    context, 'Sign In Required', 'Please Sign In'),
              ),
              IconButton(
                  icon: Icon(Icons.add_box),
                  onPressed: () async {
                    dialogs.waiting(context, 'Waiting', 'Logging In...');
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pop(context);
                  }),
              IconButton(
                icon: Icon(Icons.adjust),
                onPressed: () => dialogs.confirm(
                    context, 'Confirm', 'Do you want to continue?'),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
            ],
          ),
          body: MemberManager('Albert Tran'),
        ));
  }
}
