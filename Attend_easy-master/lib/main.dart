//import 'package:attend_easy/faculty/decisionfac.dart';
// import 'package:attend_easy/faculty/decisionfac.dart';
import 'package:attend_easy/faculty/loginfac.dart';
import 'package:attend_easy/faculty/signinfac.dart';
import 'package:attend_easy/firebase_options.dart';
//import 'package:attend_easy/routes/routes_configuration.dart';
import 'package:attend_easy/splash_screen.dart';
// import 'package:attend_easy/student/decisionstu.dart';
import 'package:attend_easy/student/loginstu.dart';
import 'package:attend_easy/student/signinstu.dart';
import 'package:attend_easy/student/stud_homepage.dart';
import 'package:attend_easy/welcome.dart';
// import 'package:attend_easy/splash_screen.dart';
// import 'package:attend_easy/student/decisionstu.dart';
// import 'package:attend_easy/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'MyAppRouteConstsnts.splashRouteScreen',
        pageBuilder: (context, state) {
          return const MaterialPage(child: splash_screen());
        },
      ),
      GoRoute(
        path: '/welcome',
        name: 'MyAppRouteConstant.welcomesplashRouteScreen',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Welcome());
        },
      ),
      //Faculty
      // GoRoute(
      //   path: '/decisionfac',
      //   name: 'MyAppRouteConstant.decisionfacRouteScreen',
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: DecisionFac());
      //   },
      // ),
      GoRoute(
        path: '/loginfac',
        name: 'MyAppRouteConstant.loginfacRouteScreen',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginFac());
        },
      ),
      GoRoute(
        path: '/signinfac',
        name: 'MyAppRouteConstant.signinfacRouteScreen',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignInFac());
        },
      ),

      //Student
      // GoRoute(
      //   path: '/decisionstu',
      //   name: 'MyAppRouteConstant.decisionstuRouteScreen',
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: DecisionStu());
      //   },
      // ),
      GoRoute(
        path: '/loginstu',
        name: 'MyAppRouteConstant.loginRouteScreen',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginStu());
        },
      ),
      GoRoute(
        path: '/signinstu',
        name: 'MyAppRouteConstant.signinstuRouteScreen',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignInStu());
        },
      ),
      GoRoute(
        path: '/stuhomepage',
        name: 'MyAppRouteConstant.stuhomepageRouteScreen',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AttendEasyScreen());
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splash_screen(),
    );
  }
}
