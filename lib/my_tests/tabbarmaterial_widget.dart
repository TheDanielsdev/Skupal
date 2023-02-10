import 'package:flutter/material.dart';

class TabBarMaterialWidget extends StatefulWidget {
  int index;
  final ValueChanged<int> onChangedTab;
  TabBarMaterialWidget({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  State<TabBarMaterialWidget> createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
        opacity: 0,
        child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)));
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        buildTabItems(itemIndex: 1, icon: Icon(Icons.home)),
        buildTabItems(itemIndex: 2, icon: Icon(Icons.search)),
        placeholder,
        buildTabItems(itemIndex: 3, icon: Icon(Icons.settings)),
        buildTabItems(itemIndex: 4, icon: Icon(Icons.mail_outline))
      ]),
    );
  }

  Widget buildTabItems({required int itemIndex, required Icon icon}) {
    final isSelected = itemIndex == widget.index;
    return IconTheme(
        data: IconThemeData(color: isSelected ? Colors.red : Colors.black),
        child: IconButton(
          icon: icon,
          onPressed: () => widget.onChangedTab(itemIndex),
        ));
  }
}
