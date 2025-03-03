import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class StudentCheckInScreen extends StatefulWidget {
  const StudentCheckInScreen({super.key});

  @override
  _StudentCheckInScreenState createState() => _StudentCheckInScreenState();
}

class _StudentCheckInScreenState extends State<StudentCheckInScreen> {
  final TextEditingController _sessionCodeController = TextEditingController();
  LocationData? _studentLocation;
  final Location _location = Location();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) return;
      }

      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) return;
      }

      _studentLocation = await _location.getLocation();
    } catch (e) {
      _showErrorDialog("Error requesting location permissions: $e");
    }
  }

  Future<void> _checkIn() async {
    final String sessionCode = _sessionCodeController.text.trim();
    if (sessionCode.isEmpty) {
      _showErrorDialog("Please enter a session code.");
      return;
    }

    // Fetch session data based on session code
    try {
      final querySnapshot = await _firestore
          .collection('attendance_sessions')
          .where('sessionCode', isEqualTo: sessionCode)
          .get();

      if (querySnapshot.docs.isEmpty) {
        _showErrorDialog("Invalid session code.");
        return;
      }

      final sessionData = querySnapshot.docs.first.data();
      final double lecturerLatitude = sessionData['lecturer_latitude'];
      final double lecturerLongitude = sessionData['lecturer_longitude'];
      final int radius = sessionData['radius'];

      // Check if student is within the valid radius
      if (_studentLocation == null ||
          !_isWithinRadius(
              _studentLocation!, lecturerLatitude, lecturerLongitude, radius)) {
        _showErrorDialog("You are outside the valid range for check-in.");
        return;
      }

      // Store student check-in details
      await _firestore
          .collection('attendance_sessions')
          .doc(querySnapshot.docs.first.id)
          .collection('check_ins')
          .add({
        'student_id': 'STUDENT_ID', // Replace with actual student ID
        'student_name': 'STUDENT_NAME', // Replace with actual student name
        'timestamp': FieldValue.serverTimestamp(),
        'latitude': _studentLocation!.latitude,
        'longitude': _studentLocation!.longitude,
      });

      _showSuccessDialog("Check-in successful!");
    } catch (e) {
      _showErrorDialog("Failed to check in: $e");
    }
  }

  bool _isWithinRadius(LocationData userLocation, double sessionLatitude,
      double sessionLongitude, int radius) {
    final double distance = _calculateDistance(
      userLocation.latitude!,
      userLocation.longitude!,
      sessionLatitude,
      sessionLongitude,
    );

    return distance <= radius;
  }

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371000; // Radius of the Earth in meters
    final double lat1Rad = _degreesToRadians(lat1);
    final double lon1Rad = _degreesToRadians(lon1);
    final double lat2Rad = _degreesToRadians(lat2);
    final double lon2Rad = _degreesToRadians(lon2);

    final double dLat = lat2Rad - lat1Rad;
    final double dLon = lon2Rad - lon1Rad;

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(dLon / 2) * sin(dLon / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c; // Distance in meters
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

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

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Check-in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sessionCodeController,
              decoration:
                  const InputDecoration(labelText: 'Enter Session Code'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkIn,
              child: const Text('Check In'),
            ),
          ],
        ),
      ),
    );
  }
}
