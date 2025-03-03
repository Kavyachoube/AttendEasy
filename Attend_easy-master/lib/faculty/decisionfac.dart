// // import 'package:attend_easy/faculty/loginfac.dart';
// // import 'package:attend_easy/faculty/signinfac.dart';
// // import 'package:attend_easy/welcome.dart';
// // import 'package:flutter/material.dart';

// // class DecisionFac extends StatefulWidget {
// //   const DecisionFac({super.key});

// //   @override
// //   State<DecisionFac> createState() => _DecisionFacState();
// // }

// class _DecisionFacState extends State<DecisionFac> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Check if the device is desktop or mobile
//         bool isDesktop = constraints.maxWidth > 600;
//         double screenWidth = constraints.maxWidth;
//         double screenHeight = constraints.maxHeight;
//         return Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Welcome(),
//                   ),
//                 );
//               },
//             ),
//             title: Text('Faculty Decision'),
//             backgroundColor: Colors.teal,
//           ),
//           body: Container(
//             width: screenWidth * 1.0,
//             color: Colors.white,
//             child: Column(
//               children: [
//                 Container(
//                   width: screenWidth * (isDesktop ? 0.5 : 0.7),
//                   height: screenHeight * (isDesktop ? 0.6 : 0.5),
//                   margin: EdgeInsets.only(top: isDesktop ? 20 : 45),
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/studing_cloud_comp.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: screenHeight * (isDesktop ? 0.1 : 0.1),
//                 ),
//                 Container(
//                   width: screenWidth * (isDesktop ? 0.4 : 0.75),
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const LoginFac(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF1DC99E),
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   width: screenWidth * (isDesktop ? 0.4 : 0.75),
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const SignInFac(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFD9D9D9),
//                       foregroundColor: const Color(0xFF1C5B41),
//                     ),
//                     child: const Text(
//                       'Signin',
//                       style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
