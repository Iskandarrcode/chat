// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatFirebaseServices {
//   final _chatCollection = FirebaseFirestore.instance.collection("messages");

//   Stream<QuerySnapshot> getMessages() {
//     return _chatCollection.snapshots();
//   }

//   Future<void> sendMessage(
//       String fromUserId, String toUserId, String text) async {
//     try {
//       // Firestore instance
//       final FirebaseFirestore firestore = FirebaseFirestore.instance;

//       // Adding new document to the messages collection
//       await firestore.collection('messages').add({
//         'fromUserId': fromUserId,
//         'toUserId': toUserId,
//         'text': text,
//         'timestamp': FieldValue.serverTimestamp(), // storing the timestamp
//       });
//     } catch (e) {
//       // Print the error for debugging
//       print('Error sending message: $e');
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseService {
  final CollectionReference<Map<String, dynamic>> _firestore =
      FirebaseFirestore.instance.collection('chat-rooms');
  final String _collectionName = 'messages';

  

  Stream<QuerySnapshot> getMessages(String chatRoomId) async* {
    yield* _firestore
        .doc(chatRoomId)
        .collection(_collectionName)
        .orderBy('time-stamp', descending: true)
        .snapshots();
  }

  void sendMessage({
    required Map<String, dynamic> data,
    required String chatRoomId,
  }) {
    _firestore.doc(chatRoomId).collection(_collectionName).add(data);
  }

}