import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

<<<<<<< HEAD
class CheckInListPage extends StatelessWidget {
  final String sessionCode; // Code for the attendance session

  const CheckInListPage({super.key, required this.sessionCode});

  Future<List<Map<String, dynamic>>> _getCheckedInStudents() async {
    List<Map<String, dynamic>> students = [];

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('attendance_sessions')
          .doc(sessionCode)
          .collection('check_ins')
          .get();

      if (querySnapshot.docs.isEmpty) {
        print('No students have checked in for this session.');
        return students; // Return empty list if no documents
      }

      for (var doc in querySnapshot.docs) {
        students.add({
          'name': doc['student_name'],
          'email': doc['email'],
          'checkedInAt': doc['timestamp'],
          'latitude': doc['latitude'],
          'longitude': doc['longitude'],
        });
      }
    } catch (e) {
      print('Failed to load checked-in students: $e');
    }

    return students;
  }
=======
class CheckedInStudentsPage extends StatelessWidget {
  const CheckedInStudentsPage({super.key});
>>>>>>> a7bb1ca9d59171c312c236456189dcfbc428c221

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checked-In Students'),
        backgroundColor: const Color(0xFF43c6ac),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('checkInHistory').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No students have checked in yet.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var studentData = snapshot.data!.docs[index];

              // Safely handling null value for studentName
              var studentName = studentData['studentName'] ?? 'Unknown Student';

              // Safely handling the checkInTime field (in case it is null)
              Timestamp? checkInTimestamp = studentData['checkInTime'];
              var checkInTime = checkInTimestamp != null
                  ? checkInTimestamp.toDate()
                  : DateTime.now(); // default to current time if null

              return ListTile(
                title: Text(studentName),
                subtitle: Text(
                    'Checked in at: ${DateFormat('hh:mm a, MMM dd').format(checkInTime)}'),
                leading: const Icon(Icons.check_circle, color: Colors.green),
              );
            },
          );
        },
      ),
    );
  }
}
