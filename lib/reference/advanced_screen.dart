// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// import 'scratch_box.dart';
//
// const _googleIcon = 'assets/google.png';
// const _dartIcon = 'assets/dart.png';
// const _flutterIcon = 'assets/flutter.png';
//
// const _icons = [
//   _googleIcon,
//   _dartIcon,
//   _flutterIcon,
// ];
//
// // _icons 중 1개 랜덤 선택
// // build 아래에 두면 안됨
// // setState() 마다 다시 랜덤이 돌아가기 때문
// final random = Random();
// String _randomIcon = _icons[random.nextInt(_icons.length)];
//
// class AdvancedScreen extends StatefulWidget {
//   @override
//   _AdvancedScreenState createState() => _AdvancedScreenState();
// }
//
// class _AdvancedScreenState extends State<AdvancedScreen>
//     with SingleTickerProviderStateMixin {
//   double validScratches = 0;
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     )..addStatusListener(
//           (listener) {
//         if (listener == AnimationStatus.completed) {
//           _animationController.reverse();
//         }
//       },
//     );
//     _animation = Tween(begin: 1.0, end: 1.25).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.elasticIn,
//       ),
//     );
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     print(_randomIcon);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Scratcher',
//                   style: TextStyle(
//                     fontFamily: 'The unseen',
//                     color: Colors.blueAccent,
//                     fontSize: 50,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const Text(
//                   'scratch to win!',
//                   style: TextStyle(
//                     fontFamily: 'The unseen',
//                     color: Colors.black,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 10),
//                   height: 1,
//                   width: 300,
//                   color: Colors.black12,
//                 )
//               ],
//             ),
//             // buildRow(_googleIcon, _flutterIcon, _googleIcon),
//             ScratchBox(
//               // image : _icons 중 1개를 랜덤으로 뽑아서 넣어줌
//               image: _randomIcon,
//               animation: _animation,
//               onScratch: () {
//                 setState(() {
//                   validScratches++;
//                   if (validScratches == 3) {
//                     _animationController.forward();
//                   }
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildRow(String left, String center, String right) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ScratchBox(image: left),
//         ScratchBox(
//           image: center,
//           animation: _animation,
//           onScratch: () {
//             setState(() {
//               validScratches++;
//               if (validScratches == 3) {
//                 _animationController.forward();
//               }
//             });
//           },
//         ),
//         ScratchBox(image: right),
//       ],
//     );
//   }
// }