import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkillItem {
  String name;
  SkillItem({required this.name});
}

class SkillData {
  static List<SkillItem> getSkillItems() {
    return [
      SkillItem(name: "Mobile"),
      SkillItem(name: "Mobile"),
      SkillItem(name: "Mobile"),
      SkillItem(name: "Mobile"),
      SkillItem(name: "Games"),
      SkillItem(name: "Games"),
      SkillItem(name: "Games"),
      SkillItem(name: "Games"),
    ];
  }
}
