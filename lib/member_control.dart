import 'package:flutter/material.dart';


class MemberControl extends StatelessWidget {
  final Function addMember;

  MemberControl(this.addMember);

  @override
    Widget build(BuildContext context) {
      return RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text("Add Something"),
            onPressed: () {
              addMember('New Member');
            },
          );
    }
}