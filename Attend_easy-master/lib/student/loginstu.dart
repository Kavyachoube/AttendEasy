// // import 'package:attend_easy/student/forgotpass.dart';
// // import 'package:attend_easy/student/signinstu.dart';
// // import 'package:attend_easy/student/stud_homepage.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class LoginStu extends StatefulWidget {
// //   const LoginStu({super.key});

// //   @override
// //   State<LoginStu> createState() => _LoginState();
// // }

// // class _LoginState extends State<LoginStu> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   final TextEditingController stuidController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   bool _isLoading = false;
// //   bool _rememberMe = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadSavedCredentials();
// //   }

// //   @override
// //   void dispose() {
// //     stuidController.dispose();
// //     passwordController.dispose();
// //     super.dispose();
// //   }

// //   Future<void> _loadSavedCredentials() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String? savedEmail = prefs.getString('email');
// //     String? savedPassword = prefs.getString('password');

// //     if (savedEmail != null && savedPassword != null) {
// //       stuidController.text = savedEmail;
// //       passwordController.text = savedPassword;
// //       _rememberMe = true;
// //     }
// //   }

// //   Future<void> _login() async {
// //     setState(() {
// //       _isLoading = true;
// //     });
// //     try {
// //       await _auth.signInWithEmailAndPassword(
// //         email: stuidController.text.trim(),
// //         password: passwordController.text.trim(),
// //       );

// //       // Save credentials if 'Remember Me' is checked
// //       if (_rememberMe) {
// //         SharedPreferences prefs = await SharedPreferences.getInstance();
// //         await prefs.setString('email', stuidController.text.trim());
// //         await prefs.setString('password', passwordController.text.trim());
// //       } else {
// //         // Clear saved credentials
// //         SharedPreferences prefs = await SharedPreferences.getInstance();
// //         await prefs.remove('email');
// //         await prefs.remove('password');
// //       }

// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => AttendEasyScreen()),
// //       );
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Login failed: ${e.toString()}")),
// //       );
// //     } finally {
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double screenHeight = MediaQuery.of(context).size.height;
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Container(
// //           width: screenWidth * 0.9,
// //           height: screenHeight * 0.8,
// //           color: const Color.fromARGB(255, 249, 249, 249),
// //           margin: const EdgeInsets.only(top: 70),
// //           child: Column(
// //             children: [
// //               Container(
// //                 width: screenWidth * 0.7,
// //                 height: 50,
// //                 margin: const EdgeInsets.only(left: 45),
// //                 child: const Text(
// //                   'Welcome back to AttendEasy!',
// //                   style: TextStyle(
// //                       fontSize: 20,
// //                       color: Colors.black,
// //                       fontFamily: 'DM Sans',
// //                       fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //               Container(
// //                 width: screenWidth * 0.7,
// //                 height: 50,
// //                 margin: const EdgeInsets.only(left: 45),
// //                 child: const Text(
// //                   'Log in to manage classes and track attendance seamlessly.',
// //                   style: TextStyle(
// //                       fontSize: 12,
// //                       color: Colors.black,
// //                       fontFamily: 'DM Sans',
// //                       fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //               Container(
// //                 width: screenWidth * 0.7,
// //                 height: 50,
// //                 margin: const EdgeInsets.only(left: 45),
// //                 child: const Text(
// //                   'Student ID',
// //                   style: TextStyle(
// //                       fontSize: 20,
// //                       color: Colors.black,
// //                       fontFamily: 'DM Sans',
// //                       fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //               Container(
// //                 width: screenWidth * 0.7,
// //                 height: 50,
// //                 margin: const EdgeInsets.only(left: 45),
// //                 child: TextField(
// //                   controller: stuidController,
// //                   decoration: InputDecoration(
// //                     hintText: 'Enter your email',
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 width: screenWidth * 0.7,
// //                 height: 50,
// //                 margin: const EdgeInsets.only(left: 45),
// //                 child: const Text(
// //                   'Password',
// //                   style: TextStyle(
// //                       fontSize: 20,
// //                       color: Colors.black,
// //                       fontFamily: 'DM Sans',
// //                       fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //               Container(
// //                 width: screenWidth * 0.7,
// //                 height: 50,
// //                 margin: const EdgeInsets.only(left: 45),
// //                 child: TextField(
// //                   controller: passwordController,
// //                   obscureText: true,
// //                   decoration: InputDecoration(
// //                     hintText: 'Enter your password',
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Checkbox(
// //                     value: _rememberMe,
// //                     onChanged: (bool? value) {
// //                       setState(() {
// //                         _rememberMe = value ?? false;
// //                       });
// //                     },
// //                   ),
// //                   const Text('Remember Me'),
// //                 ],
// //               ),
// //               Container(
// //                 width: screenWidth * 0.7,
// //                 margin: const EdgeInsets.only(left: 38),
// //                 child: Row(
// //                   children: [
// //                     const Text('Forgot Password?'),
// //                     TextButton(
// //                       onPressed: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => Forgot(),
// //                           ),
// //                         );
// //                       },
// //                       child: const Text(
// //                         'Reset it',
// //                         style: TextStyle(
// //                           color: Color(0xFF1C5B41),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Container(
// //                 width: screenWidth * 0.7,
// //                 margin: const EdgeInsets.only(left: 45),
// //                 height: 50,
// //                 child: ElevatedButton(
// //                   onPressed: _isLoading ? null : _login,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFF1DC99E),
// //                     foregroundColor: Colors.white,
// //                   ),
// //                   child: _isLoading
// //                       ? const CircularProgressIndicator(
// //                           valueColor:
// //                               AlwaysStoppedAnimation<Color>(Colors.white),
// //                         )
// //                       : const Text(
// //                           'Login',
// //                           style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
// //                         ),
// //                 ),
// //               ),
// //               Container(
// //                 margin: const EdgeInsets.only(left: 45),
// //                 width: screenWidth * 0.7,
// //                 child: Row(
// //                   children: [
// //                     const Text("Don't have an account?"),
// //                     TextButton(
// //                       onPressed: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => const SignInStu(),
// //                           ),
// //                         );
// //                       },
// //                       child: const Text(
// //                         'Sign Up',
// //                         style: TextStyle(
// //                           color: Color(0xFF1DC99E),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:attend_easy/student/forgotpass.dart';
// import 'package:attend_easy/student/signinstu.dart';
// import 'package:attend_easy/student/stud_homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginStu extends StatefulWidget {
//   const LoginStu({super.key});

//   @override
//   State<LoginStu> createState() => _LoginState();
// }

// class _LoginState extends State<LoginStu> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController stuidController = TextEditingController();
//   final TextEditingController nameController =
//       TextEditingController(); // Controller for Name
//   final TextEditingController passwordController = TextEditingController();
//   bool _isLoading = false;
//   bool _rememberMe = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSavedCredentials();
//   }

//   @override
//   void dispose() {
//     stuidController.dispose();
//     nameController.dispose(); // Dispose the name controller
//     passwordController.dispose();
//     super.dispose();
//   }

//   // Load saved credentials (Student ID, password, and name)
//   Future<void> _loadSavedCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedEmail = prefs.getString('email');
//     String? savedPassword = prefs.getString('password');
//     String? savedName = prefs.getString('name'); // Load saved name

//     if (savedEmail != null && savedPassword != null) {
//       stuidController.text = savedEmail;
//       passwordController.text = savedPassword;
//       nameController.text = savedName ?? ''; // Set the saved name if exists
//       _rememberMe = true;
//     }
//   }

//   // Login function
//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: stuidController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       // Save credentials and name if 'Remember Me' is checked
//       if (_rememberMe) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('email', stuidController.text.trim());
//         await prefs.setString('password', passwordController.text.trim());
//         await prefs.setString(
//             'name', nameController.text.trim()); // Save the name
//       } else {
//         // Clear saved credentials and name if 'Remember Me' is unchecked
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.remove('email');
//         await prefs.remove('password');
//         await prefs.remove('name');
//       }

//       // Navigate to the student home page and pass the name
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AttendEasyScreen(), // Pass name to home page
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Login failed: ${e.toString()}")),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: screenWidth * 0.9,
//           height: screenHeight * 0.8,
//           color: const Color.fromARGB(255, 249, 249, 249),
//           margin: const EdgeInsets.only(top: 70),
//           child: Column(
//             children: [
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: const Text(
//                   'Welcome back to AttendEasy!',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontFamily: 'DM Sans',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               // Name field
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: const Text(
//                   'Name',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontFamily: 'DM Sans',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter your name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               // Student ID field
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: const Text(
//                   'Student ID',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontFamily: 'DM Sans',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: TextField(
//                   controller: stuidController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter your email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               // Password field
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: const Text(
//                   'Password',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontFamily: 'DM Sans',
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.7,
//                 height: 50,
//                 margin: const EdgeInsets.only(left: 45),
//                 child: TextField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Enter your password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               // Remember Me checkbox
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Checkbox(
//                     value: _rememberMe,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         _rememberMe = value ?? false;
//                       });
//                     },
//                   ),
//                   const Text('Remember Me'),
//                 ],
//               ),
//               // Forgot Password link
//               Container(
//                 width: screenWidth * 0.7,
//                 margin: const EdgeInsets.only(left: 38),
//                 child: Row(
//                   children: [
//                     const Text('Forgot Password?'),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Forgot(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'Reset it',
//                         style: TextStyle(
//                           color: Color(0xFF1C5B41),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Login button
//               Container(
//                 width: screenWidth * 0.7,
//                 margin: const EdgeInsets.only(left: 45),
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: _isLoading ? null : _login,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF1DC99E),
//                     foregroundColor: Colors.white,
//                   ),
//                   child: _isLoading
//                       ? const CircularProgressIndicator(
//                           valueColor:
//                               AlwaysStoppedAnimation<Color>(Colors.white),
//                         )
//                       : const Text(
//                           'Login',
//                           style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
//                         ),
//                 ),
//               ),
//               // Sign Up link
//               Container(
//                 margin: const EdgeInsets.only(left: 45),
//                 width: screenWidth * 0.7,
//                 child: Row(
//                   children: [
//                     const Text("Don't have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const SignInStu(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'Sign Up',
//                         style: TextStyle(
//                           color: Color(0xFF1DC99E),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:attend_easy/student/forgotpass.dart';
import 'package:attend_easy/student/signinstu.dart';
import 'package:attend_easy/student/stud_homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStu extends StatefulWidget {
  const LoginStu({super.key});

  @override
  State<LoginStu> createState() => _LoginState();
}

class _LoginState extends State<LoginStu> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController stuidController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _checkAutoLogin(); // Check for automatic login on startup
  }

  @override
  void dispose() {
    stuidController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Check if saved credentials exist and perform login
  Future<void> _checkAutoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (savedEmail != null && savedPassword != null) {
      // Attempt to log in automatically
      try {
        await _auth.signInWithEmailAndPassword(
          email: savedEmail,
          password: savedPassword,
        );

        // Navigate to home screen after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AttendEasyScreen()),
        );
      } catch (e) {
        // Handle any errors silently or show a message
        print("Automatic login failed: ${e.toString()}");
      }
    }
  }

  // Login function
  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await _auth.signInWithEmailAndPassword(
        email: stuidController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Save credentials if 'Remember Me' is checked
      if (_rememberMe) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', stuidController.text.trim());
        await prefs.setString('password', passwordController.text.trim());
        await prefs.setString('name', nameController.text.trim());
      } else {
        // Clear saved credentials if 'Remember Me' is unchecked
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('email');
        await prefs.remove('password');
        await prefs.remove('name');
      }

      // Navigate to the student home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AttendEasyScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${e.toString()}")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.8,
          color: const Color.fromARGB(255, 249, 249, 249),
          margin: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Welcome back to AttendEasy!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Name field
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              // Student ID field
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Student ID',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  controller: stuidController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              // Password field
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              // Remember Me checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text('Remember Me'),
                ],
              ),
              // Forgot Password link
              Container(
                width: screenWidth * 0.7,
                margin: const EdgeInsets.only(left: 38),
                child: Row(
                  children: [
                    const Text('Forgot Password?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Forgot(),
                          ),
                        );
                      },
                      child: const Text(
                        'Reset it',
                        style: TextStyle(
                          color: Color(0xFF1C5B41),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Login button
              Container(
                width: screenWidth * 0.7,
                margin: const EdgeInsets.only(left: 45),
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1DC99E),
                    foregroundColor: Colors.white,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                        ),
                ),
              ),
              // Sign Up link
              Container(
                margin: const EdgeInsets.only(left: 45),
                width: screenWidth * 0.7,
                child: Row(
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInStu(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF1DC99E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
