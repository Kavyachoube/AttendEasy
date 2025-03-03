// import 'package:attend_easy/faculty/Manages_courses.dart';
// import 'package:attend_easy/faculty/attendance_rep.dart';
// import 'package:attend_easy/faculty/new_session.dart';
// import 'package:attend_easy/faculty/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// class Home extends StatefulWidget {
//   final String facultyName;
//   const Home({Key? key, required this.facultyName}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late PersistentTabController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0); // Set initial tab
//   }

//   List<Widget> _buildScreens() {
//     return [
//       _buildHomeScreen(), // Home screen content
//       FacultyProfile(
//         facultyName: widget.facultyName,
//       ), // Profile page
//       AttendanceRep(), // History page for attendance reports
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.home),
//         title: ("Home"),
//         activeColorPrimary: const Color(0xFF1DC99E),
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.account_circle),
//         title: ("Profile"),
//         activeColorPrimary: const Color(0xFF1DC99E),
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.history),
//         title: ("History"),
//         activeColorPrimary: const Color(0xFF1DC99E),
//         inactiveColorPrimary: Colors.grey,
//       ),
//     ];
//   }

//   Widget _buildHomeScreen() {
//     return LayoutBuilder(builder: (context, Constraints) {
//       bool isDesktop = Constraints.maxWidth > 600;
//       double screenWidth = Constraints.maxWidth;
//       double screenHeight = Constraints.maxHeight;

//       return Scaffold(
//         body: Center(
//           child: SizedBox(
//             width: screenWidth * 1.0,
//             height: screenHeight * 1.0,
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(
//                   horizontal: isDesktop ? screenWidth * 0.1 : 0, vertical: 10),
//               child: Column(
//                 children: [
//                   // Header
//                   Container(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     margin: const EdgeInsets.only(top: 70),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(),
//                         Expanded(
//                           child: Text(
//                             'Hello, ${widget.facultyName}!',
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontSize: 24,
//                               fontFamily: 'DM Sans',
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         // Container(
//                         //   child: IconButton(
//                         //     icon: const Icon(Icons.account_circle),
//                         //     onPressed: () {
//                         //       Navigator.pushReplacement(
//                         //         context,
//                         //         MaterialPageRoute(
//                         //             builder: (context) =>
//                         //                 const FacultyProfile()),
//                         //       );
//                         //     },
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     child: const Text(
//                       'Welcome back to AttendEasy!',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontFamily: 'DM Sans',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Info Cards
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: screenHeight * 0.3,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: _buildInfoCard(
//                             title: 'Attendance Reports',
//                             icon: Icons.assignment,
//                             onTap: () {
//                               PersistentNavBarNavigator.pushNewScreen(
//                                 context,
//                                 screen: const AttendanceRep(),
//                                 withNavBar: false,
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 20), // Add space between cards
//                         Expanded(
//                           child: _buildInfoCard(
//                             title: 'Manage Courses',
//                             icon: Icons.book,
//                             onTap: () {
//                               PersistentNavBarNavigator.pushNewScreen(
//                                 context,
//                                 screen: const MAnagesCourses(),
//                                 withNavBar: false,
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Ongoing Sessions
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Ongoing Attendance Sessions',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'DM Sans',
//                           ),
//                         ),
//                         // const Text(
//                         //   'Finished Today',
//                         //   style: TextStyle(
//                         //     fontSize: 18,
//                         //     fontWeight: FontWeight.w400,
//                         //     fontFamily: 'DM Sans',
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: screenHeight * 0.15,
//                     child: const Center(
//                       child: Text(
//                         'There are no ongoing attendance sessions. Start a new one to take attendance.',
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                   // New Session Button
//                   SizedBox(
//                     width: screenWidth * (isDesktop ? 0.6 : 0.85),
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         PersistentNavBarNavigator.pushNewScreen(
//                           context,
//                           screen: const NewAttendanceSessionScreen(),
//                           withNavBar: false,
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF1DC99E),
//                         foregroundColor: const Color(0xFFFFFFFF),
//                       ),
//                       child: const Text(
//                         'New Session',
//                         style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   Widget _buildInfoCard(
//       {required String title,
//       required IconData icon,
//       required VoidCallback onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         margin:
//             const EdgeInsets.symmetric(vertical: 10), // Add vertical spacing
//         padding: const EdgeInsets.all(16), // Add padding
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: const Color(0xffD9D9D9),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundColor: const Color(0xff1DC99E),
//               radius: 30,
//               child: Icon(
//                 icon,
//                 size: 40,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 15),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontFamily: 'DM Sans',
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xff1C5B41),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineToSafeArea: true,
//       backgroundColor: Colors.white, // Nav bar color
//       handleAndroidBackButtonPress: true,
//       resizeToAvoidBottomInset: true,
//       stateManagement: true,
//       navBarStyle: NavBarStyle.style3, // Choose the style of the nav bar
//     );
//   }
// }
import 'package:attend_easy/faculty/Manages_courses.dart';
import 'package:attend_easy/faculty/attendance_rep.dart';
import 'package:attend_easy/faculty/new_session.dart';
import 'package:attend_easy/faculty/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String facultyName;
  const Home({Key? key, required this.facultyName}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _buildHomeScreen() {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;

      return Scaffold(
        appBar: AppBar(
          title: Text('Hello, ${widget.facultyName}!'),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FacultyProfile(
                      facultyName: widget.facultyName,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AttendanceRep(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: SizedBox(
            width: screenWidth * 1.0,
            height: screenHeight * 1.0,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? screenWidth * 0.1 : 0, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    child: const Text(
                      'Welcome back to AttendEasy!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: screenHeight * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            title: 'Attendance Reports',
                            icon: Icons.assignment,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AttendanceRep()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 20), // Add space between cards
                        Expanded(
                          child: _buildInfoCard(
                            title: 'Manage Courses',
                            icon: Icons.book,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MAnagesCourses()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Ongoing Attendance Sessions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DM Sans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: screenHeight * 0.15,
                    child: const Center(
                      child: Text(
                        'There are no ongoing attendance sessions. Start a new one to take attendance.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const NewAttendanceSessionScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1DC99E),
                        foregroundColor: const Color(0xFFFFFFFF),
                      ),
                      child: const Text(
                        'New Session',
                        style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildInfoCard(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:
            const EdgeInsets.symmetric(vertical: 10), // Add vertical spacing
        padding: const EdgeInsets.all(16), // Add padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffD9D9D9),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xff1DC99E),
              radius: 30,
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.bold,
                color: Color(0xff1C5B41),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHomeScreen();
  }
}
