import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_result/provider.dart';

class giveresult {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> _loginn() async {
    // Query the Firestore collection to find the matching username
    QuerySnapshot querySnapshot = await _firestore
        .collection('Users')
        .where('username', isEqualTo: userservice.username)
        .limit(1)
        .get();

    // Get the first document that matches the query
    DocumentSnapshot userDoc = querySnapshot.docs.first;
    String overallresult = userDoc['Overall'];
  }
}
