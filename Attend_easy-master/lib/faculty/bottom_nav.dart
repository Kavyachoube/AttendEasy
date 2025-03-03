// import 'package:attend_easy/faculty/history.dart';
// import 'package:attend_easy/faculty/home.dart';
// import 'package:attend_easy/faculty/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// class Bottom_Nav extends StatefulWidget {
//   const Bottom_Nav({super.key});

//   @override
//   State<Bottom_Nav> createState() => _Bottom_NavState();
// }

// class _Bottom_NavState extends State<Bottom_Nav> {
//   final _controller = PersistentTabController(initialIndex: 0);

//   List<Widget> screens() {
//     return [
//       const Home(),
//       const History(),
//       const FacultyProfile(),
//     ];
//   }

//   List<PersistentBottomNavBarItem> navBarItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.home),
//         title: "Home",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.yellow,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.history),
//         title: "History",
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.account_circle),
//         title: "Profile",
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       screens: screens(),
//       items: navBarItems(),
//       controller: _controller,
//       navBarStyle: NavBarStyle.style1,
//     );
//   }
// }
