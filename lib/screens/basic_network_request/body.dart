import 'package:flutter/material.dart';
import 'package:skupal/screens/basic_network_request/details.dart';
import 'package:skupal/screens/basic_network_request/mode.dart';
import 'package:skupal/screens/basic_network_request/service.dart';

class BodyMy extends StatefulWidget {
  BodyMy({Key? key}) : super(key: key);

  @override
  State<BodyMy> createState() => _BodyMyState();
}

class _BodyMyState extends State<BodyMy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<GetUsers>>(
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailsPage(
                                    user: snapshot.data![index].name,
                                    email: snapshot.data![index].email,
                                  )));
                    },
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].email),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
        future: getUsers(),
      ),
    );
  }
}
