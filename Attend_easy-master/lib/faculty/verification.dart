import 'package:attend_easy/faculty/loginfac.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;
      return Scaffold(
        body: Center(
          child: Container(
            width: screenWidth * 1.0,
            height: screenHeight * 1.0,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  height: 50,
                  margin: const EdgeInsets.only(top: 70),
                  child: const Text(
                    'User Verification!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  child: const Text(
                    'We just sent a one-time password to your registered phone +91XX XX89 XX54 to make sure it’s you.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  child: const Text(
                    'Verification Code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  child: Row(
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Reset OTP',
                            style: TextStyle(
                              color: Color(0xFF1C5B41),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: const Text(
                          ' Didn’t receive OTP?',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
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
                              builder: (context) => const LoginFac()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1DC99E),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                      )),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
