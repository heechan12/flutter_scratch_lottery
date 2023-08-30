import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ResultWidget extends StatefulWidget {
  final bool isWin;
  final TextEditingController teamNameController;
  final TextEditingController nameController;

  ResultWidget({
    super.key,
    required this.isWin,
    required this.teamNameController,
    required this.nameController,
  });

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  final FocusNode _teamFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  bool _isTeamFocused = false;
  bool _isNameFocused = false;

  bool _isButtonDisabled = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _teamFocusNode.addListener(_handleTeamFocusChange);
    _nameFocusNode.addListener(_handleNameFocusChange);
    super.initState();
  }

  void _handleTeamFocusChange() {
    setState(() {
      _isTeamFocused = _teamFocusNode.hasFocus;
    });
  }

  void _handleNameFocusChange() {
    setState(() {
      _isNameFocused = _nameFocusNode.hasFocus;
    });
  }

  void _disableButton() {
    setState(() {
      _isButtonDisabled = true;
    });
  }

  @override
  void dispose() {
    _teamFocusNode.removeListener(_handleTeamFocusChange);
    _teamFocusNode.dispose();
    _nameFocusNode.removeListener(_handleNameFocusChange);
    _nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _isButtonDisabled
            ? TextForm("수고하셨습니다!\n즐거운 추석 연휴 보내세요!")
            : widget.isWin
                ? TextForm("축하합니다\n아래에 정보를 입력해주세요!")
                : TextForm("아쉽네요...\n아래에 정보를 입력해주세요!"),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                focusNode: _teamFocusNode,
                controller: widget.teamNameController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: PRIMARY_COLOR,
                      width: 2,
                    ),
                  ),
                  labelText: '팀명',
                  labelStyle: _isTeamFocused
                      ? const TextStyle(color: PRIMARY_COLOR)
                      : const TextStyle(color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '팀명을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                focusNode: _nameFocusNode,
                controller: widget.nameController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: PRIMARY_COLOR,
                      width: 2,
                    ),
                  ),
                  labelText: '이름',
                  labelStyle: _isNameFocused
                      ? const TextStyle(color: PRIMARY_COLOR)
                      : const TextStyle(color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 입력해주세요';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: PRIMARY_COLOR,
          ),
          onPressed: _isButtonDisabled ? null : onPressed,
          child: const Text(
            "결과 전송",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void onPressed() {
    if (formKey.currentState!.validate()) {
      print("validate 통과");
      print("팀명 : ${widget.teamNameController.text}");
      print("이름 : ${widget.nameController.text}");
      print("isWin : ${widget.isWin}");
      setState(() {
        _disableButton();
      });
    }
  }
}

Widget TextForm(String text) {
  return Center(child: Text(text, style: const TextStyle(fontSize: 24)));
}
