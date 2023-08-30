import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scratch_lottery_card/screen/result_widget_screen.dart';
import 'package:scratch_lottery_card/screen/scratch_box.dart';

const _winIcon = 'assets/win.png';
const _loseIcon = 'assets/lose.png';
var _icons = List.generate(5, (index) => index == 0 ? _loseIcon : _winIcon);

final random = Random();
String _randomIcon = _icons[random.nextInt(_icons.length)];

class ScratchScreen extends StatefulWidget {
  ScratchScreen({super.key});

  @override
  State<ScratchScreen> createState() => _ScratchScreenState();
}

class _ScratchScreenState extends State<ScratchScreen>
    with SingleTickerProviderStateMixin {
  double validScratches = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool isScratchWin = false;
  bool isScratchDone = false;
  bool isSubmitDone = false;

  TextEditingController teamNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void _isDone(bool result) {
    setState(() {
      isScratchDone = result;
      print("isDone : $isScratchDone");
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..addStatusListener(
        (listener) {
          if (listener == AnimationStatus.completed) {
            _animationController.reverse();
          }
        },
      );
    _animation = Tween(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticIn,
      ),
    );

    if (_randomIcon == _winIcon) {
      isScratchWin = true;
    } else {
      isScratchWin = false;
    }

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("아이콘 : $_randomIcon");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 스크래치 영역
            ScratchBox(
              image: _randomIcon,
              animation: _animation,
              onScratch: () {
                setState(() {
                  validScratches++;
                  _animationController.forward();
                });
              },
              isDone: _isDone,
            ),

            // 결과 영역
            if (isScratchDone)
              ResultWidget(
                isWin: isScratchWin,
                teamNameController: teamNameController,
                nameController: nameController,
              ),
          ],
        ),
      ),
    );
  }
}

