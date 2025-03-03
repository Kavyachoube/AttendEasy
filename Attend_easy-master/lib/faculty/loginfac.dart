import 'package:attend_easy/faculty/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:attend_easy/faculty/signinfac.dart';

class LoginFac extends StatefulWidget {
  const LoginFac({super.key});

  @override
  State<LoginFac> createState() => _LoginState();
}

class _LoginState extends State<LoginFac> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController staffIDController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController =
      TextEditingController(); // Controller for Name
  String errorMessage = '';
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  @override
  void dispose() {
    staffIDController.dispose();
    passwordController.dispose();
    nameController.dispose(); // Dispose of name controller
    super.dispose();
  }

  // Check if the user is already logged in
  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      String? savedName = prefs.getString('name'); // Get saved name
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Home(facultyName: savedName ?? ''), // Pass name to home page
        ),
      );
    }
  }

  // Login function
  Future<void> _login() async {
    try {
      // Attempt sign-in with Firebase
      await _auth.signInWithEmailAndPassword(
        email: staffIDController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Save login details and name if 'Remember Me' is checked
      if (_rememberMe) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('staffID', staffIDController.text.trim());
        await prefs.setString('password', passwordController.text.trim());
        await prefs.setString('name', nameController.text.trim()); // Save name
        await prefs.setBool('isLoggedIn', true);
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.clear(); // Clear credentials if 'Remember Me' is unchecked
      }

      // Navigate to Home page on success and pass the name
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
              facultyName:
                  nameController.text.trim()), // Pass name to home page
        ),
      );
    } catch (e) {
      // Show error message if login fails
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 600;
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Welcome back to AttendEasy!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: screenWidth * 1.0,
                height: screenHeight * (isDesktop ? 1.0 : 1.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Log in to manage classes and track attendance seamlessly.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Name Field
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextField(
                        controller: nameController, // Capture name input
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // Staff ID Field
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Staff ID',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextField(
                        controller: staffIDController, // Capture staff ID input
                        decoration: InputDecoration(
                          hintText: 'Enter your staff ID',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // Password Field
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextField(
                        controller:
                            passwordController, // Capture password input
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // Remember Me Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                        ),
                        const Text('Remember Me'),
                      ],
                    ),
                    // Login Button
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1DC99E),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                        ),
                      ),
                    ),
                    // Display error message
                    if (errorMessage.isNotEmpty)
                      Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    // Sign Up Link
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: Row(
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInFac(),
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
          ),
        );
      },
    );
  }
}
