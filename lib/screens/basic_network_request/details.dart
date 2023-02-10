import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  String user;
  String email;
  DetailsPage({Key? key, required this.user, required this.email})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user),
      ),
      body: Center(
        child: Text(widget.email),
      ),
    );
  }
}
