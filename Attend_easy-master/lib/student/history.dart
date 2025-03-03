import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String lastSessionCode = '';
  String lastCheckInTime = '';

  @override
  void initState() {
    super.initState();
    _loadCheckInData();
  }

  Future<List<DocumentSnapshot>> _getCheckInHistory() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore
        .collection('checkInHistory')
        .where('student_id', isEqualTo: '')
        .orderBy('check_in_time', descending: true)
        .get();

    return snapshot.docs;
  }

  // Load the session code and check-in time from SharedPreferences
  Future<void> _loadCheckInData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lastSessionCode = prefs.getString('lastSessionCode') ?? 'No session code';
      lastCheckInTime =
          prefs.getString('lastCheckInTime') ?? 'No check-in time';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Last Check-In",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Session Code: $lastSessionCode"),
            Text("Check-In Time: $lastCheckInTime"),
          ],
        ),
      ),
    );
  }
}
