// 팀명과 이름을 입력받는 위젯
import 'package:flutter/material.dart';
import 'package:scratch_lottery_card/constant/constant.dart';

class TeamNameWidget extends StatelessWidget {
  const TeamNameWidget({
    Key? key,
    required this.teamNameController,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController teamNameController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: teamNameController,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR, width: 2,),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR, width: 2,),
            ),

            labelText: '팀명',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR),
            ),
            labelText: '이름',
          ),
        ),
      ],
    );
  }
}
