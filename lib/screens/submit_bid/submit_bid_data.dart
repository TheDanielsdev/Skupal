import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubmitBidItem {
  String desc;
  Widget widget;
  SubmitBidItem({required this.desc, required this.widget});
}

class SubmitBidData {
  static List<SubmitBidItem> getSubmitBidItems() {
    return [
      SubmitBidItem(desc: 'How are you proposing?', widget: Container()),
      SubmitBidItem(
        desc: 'How are you proposing?',
        widget: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton(
            borderRadius: BorderRadius.circular(10),
            underline: Container(
              width: 0,
            ),

            // Initial Value

            value: dropdownvalue,

            // Down Arrow Icon

            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items

            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),

            // After selecting the desired option,it will

            // change button value to selected value

            onChanged: (String? newValue) {
              // setState(() {
              //   dropdownvalue = newValue!;
              //   print(dropdownvalue);
              // });
            },
          ),
        ),
      ),
      SubmitBidItem(desc: 'How are you proposing?', widget: Container())
    ];
  }
}

String dropdownvalue = '';
// final dropdownvalue = StateProvider((ref) => )

// List of items in our dropdown menu

var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];
