import 'package:flutter/material.dart';

class ContainerList extends StatelessWidget {
  String title;
  String desc;
  ContainerList({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Set<dynamic> set = {};
    final savedAlready = set.contains(title + desc);
    return ListTile(
      title: Text(title),
      subtitle: Text(desc),
      trailing: IconButton(
          onPressed: () {
            if (savedAlready) {
              set.remove(title + desc);
            } else {
              set.add(title + desc);
            }
          },
          icon: Icon(
            savedAlready ? Icons.favorite : Icons.favorite_border,
            color: savedAlready ? Colors.red : null,
          )),
    );
  }
}
