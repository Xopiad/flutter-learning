import 'package:flutter/material.dart';

import './members.dart';
import './member_control.dart';

class MemberManager extends StatefulWidget {
  final String startingMember;

  MemberManager(this.startingMember);

  @override
  State<StatefulWidget> createState() {
    return _MemberManagerState();
  }
}

class _MemberManagerState extends State<MemberManager> {
  List<String> _members = [];

  @override
  void initState() {
    _members.add(widget.startingMember);
    super.initState();
  }

  void _addMember(String member) {
    setState(() {
      _members.add(member);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: MemberControl(_addMember),
        ),
        Members(_members),
      ],
    );
  }
}
