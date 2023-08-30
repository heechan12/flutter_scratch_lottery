import 'package:flutter/material.dart';
import 'package:scratch_lottery_card/constant/constant.dart';
import 'package:scratch_lottery_card/screen/scratch_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              children: [
                const Text(
                  '모바일서비스개발랩',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '행운권',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                    Text(
                      ' 추첨',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Icon(
                      Icons.favorite,
                      color: PRIMARY_COLOR,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '긁어주세요!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Icon(
                  Icons.arrow_downward,
                  size: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                ScratchScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
