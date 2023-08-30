// import 'package:flutter/material.dart';
// import 'package:scratcher/scratcher.dart';
//
// import 'advanced_screen.dart';
// import 'basic_screen.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         bottomNavigationBar: SafeArea(
//           child: TabBar(
//             labelColor: Colors.blueAccent,
//             unselectedLabelColor: Colors.blueGrey,
//             indicatorColor: Colors.blueAccent,
//             indicatorSize: TabBarIndicatorSize.label,
//             tabs: [
//               Tab(icon: Icon(Icons.looks_one)),
//               Tab(icon: Icon(Icons.looks_two)),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           physics: const NeverScrollableScrollPhysics(),
//           children: [
//             AdvancedScreen(),
//             BasicScreen(),
//           ],
//         ),
//       ),
//
//     );
//   }
// }
