import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:skupal/models/get_skills.dart';
import 'package:skupal/screens/basic_network_request/service.dart';
import 'package:skupal/screens/skills/skill_item.dart';
import 'package:skupal/screens/skills/skills.dart';
import 'package:skupal/services/skupal_repo.dart';

import '../../helper/appcolors.dart';

// final item = SkillData.getSkillItems();

// final myDtata = FutureProvider<GetSkills>((ref) {
//   final check = ref.watch(skupalRepoProvider);
//   final token = ref.watch(authTokenProvider);
//   return check.getSkills(token);
// });

// class SkillsChip extends ConsumerStatefulWidget {
//   final List skillList;
//   SkillsChip({Key? key, required this.skillList}) : super(key: key);

//   @override
//   SkillsChipState createState() => SkillsChipState();
// }

// class SkillsChipState extends ConsumerState<SkillsChip> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       shrinkWrap: true,
//       children:
//           widget.skillList.map((e) => MyChip(name: e.toString())).toList(),
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 50,
//           childAspectRatio: 3 / 3,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10),
//     );
//     ;
//   }
// }

// FutureBuilder<GetSkills> _buildBody(BuildContext context, WidgetRef ref) {
//   final client = ref.read(skupalRepoProvider);
//   final token = ref.read(authTokenProvider);
//   return FutureBuilder<GetSkills>(
//     future: client.getSkills(token),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.done) {
//         final GetSkills? skills = snapshot.data;
//         return _buildGrid(context, skills!);
//       } else {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//     },
//   );
// }

// Widget _buildGrid(BuildContext context, GetSkills? skills) {
//   return
// }

class MyChip extends StatefulWidget {
  String name;
  VoidCallback deleteChip;

  MyChip({Key? key, required this.name, required this.deleteChip})
      : super(key: key);

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  bool _isVisibl = true;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Chip(
          visualDensity: VisualDensity.standard,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: AppColor.Subtle,
          label: Text(widget.name,
              style: TextStyle(
                  fontFamily: 'CerebriSansPro-Regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColor.Neutral1)),
          onDeleted: (() {
            setState(() {
              widget.deleteChip();
              print(widget.name);
            });
          }),
          deleteIcon: Icon(
            Icons.close,
            color: AppColor.Neutral1,
            size: 15,
          ),
        );
      },
    );
  }
}
