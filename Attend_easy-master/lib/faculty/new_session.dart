import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Session());
}

class Session extends StatelessWidget {
  const Session({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewAttendanceSessionScreen(),
    );
  }
}

class NewAttendanceSessionScreen extends StatefulWidget {
  const NewAttendanceSessionScreen({super.key});

=======
import 'dart:async';
import 'dart:math';

class NewAttendanceSessionScreen extends StatefulWidget {
>>>>>>> a7bb1ca9d59171c312c236456189dcfbc428c221
  @override
  _NewAttendanceSessionScreenState createState() =>
      _NewAttendanceSessionScreenState();
}

class _NewAttendanceSessionScreenState
    extends State<NewAttendanceSessionScreen> {
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _radiusController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final Random _random = Random();
  Position? _currentPosition;
  String _generatedCode = '';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission(); // Request location permissions on screen load
  }

  // Check and request location permissions
  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        _showErrorDialog(
            "Location permissions are denied. Please allow them in the app settings.");
        return;
      }
    }

    // After granting permission, get the current location
    _getCurrentLocation();
  }

  // Get the current location
  Future<void> _getCurrentLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      _showErrorDialog("Could not fetch location: $e");
    }
  }

  // Generate a random six-digit session code
  String _generateSessionCode() {
    return (_random.nextInt(900000) + 100000).toString(); // Six-digit code
  }

  // Store the generated session details in Firestore
  Future<void> _storeSessionInFirestore(int duration, int radius) async {
    if (_currentPosition != null) {
      try {
        _generatedCode = _generateSessionCode();

        // Add the session document to Firestore
        final sessionRef =
            await _firestore.collection('attendance_sessions').add({
          'sessionCode': _generatedCode,
          'lecturer_latitude': _currentPosition!.latitude,
          'lecturer_longitude': _currentPosition!.longitude,
          'radius': radius,
          'createdAt': FieldValue.serverTimestamp(),
        });

        _showCodeDialog(
            _generatedCode, duration, radius); // Show success message

        // Start the expiry timer
        _startSessionExpiry(
            duration, sessionRef.id); // Pass the document ID for deletion
      } catch (e) {
        _showErrorDialog("Error storing session: $e");
      }
    } else {
      _showErrorDialog(
          "Location data not available. Please grant permissions.");
    }
  }

  // Expire session after the provided duration
  void _startSessionExpiry(int duration, String sessionId) {
    Timer(Duration(minutes: duration), () async {
      // Delete session from Firestore
      try {
        await _firestore
            .collection('attendance_sessions')
            .doc(sessionId)
            .delete();
        _showExpiredDialog(); // Notify the user that the session has expired
      } catch (e) {
        _showErrorDialog("Error deleting session: $e");
      }
    });
  }

  // Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Show dialog for generated session code
  void _showCodeDialog(String code, int duration, int radius) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Session Code'),
          content: Text(
              'Your session code is: $code\n\nThis code will expire in $duration minutes and is valid within $radius meters.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Show session expired dialog
  void _showExpiredDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Session Expired'),
          content: const Text(
              'The session code has expired and the session has been deleted.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Handle the session generation
  void _onGenerateSessionPressed() {
    final int duration = int.tryParse(_durationController.text) ?? 0;
    final int radius = int.tryParse(_radiusController.text) ?? 0;

    // Check if the location data is available
    if (_currentPosition == null) {
      _showErrorDialog(
          "Location data not available. Please grant permissions.");
      return;
    }
    if (duration <= 0 || radius <= 0 || _venueController.text.isEmpty) {
      _showErrorDialog("Please fill all fields with valid values.");
      return;
    }

    _storeSessionInFirestore(duration, radius); // Store session in Firestore
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Attendance Session',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'DM Sans',
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Course',
                labelStyle: TextStyle(
                  fontFamily: 'DM Sans',
                ),
                hintText: 'Select course',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _venueController,
              decoration: const InputDecoration(
                labelText: 'Venue',
                labelStyle: TextStyle(
                  fontFamily: 'DM Sans',
                ),
                hintText: 'Enter attendance venue',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _radiusController,
              decoration: const InputDecoration(
                labelText: 'Geolocation Radius',
                labelStyle: TextStyle(
                  fontFamily: 'DM Sans',
                ),
                hintText: 'Choose radius in meters',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _durationController,
              decoration: const InputDecoration(
                labelText: 'Code Duration',
                labelStyle: TextStyle(
                  fontFamily: 'DM Sans',
                ),
                hintText: 'Choose duration in minutes',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _onGenerateSessionPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DC99E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Generate Session Code',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'DM Sans',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
