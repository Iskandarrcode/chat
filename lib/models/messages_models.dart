// import 'package:cloud_firestore/cloud_firestore.dart';

// class Message {
//   final String id;
//   final String senderId;
//   final String text;
//   final String fromUserId;
//   final Timestamp timestamp;

//   Message({
//     required this.id,
//     required this.senderId,
//     required this.text,
//     required this.fromUserId,
//     required this.timestamp,
//   });

//   factory Message.fromJson(QueryDocumentSnapshot query) {
//     return Message(
//       id: query.id,
//       senderId: query["toUserId"],
//       text: query["text"],
//       fromUserId: query['fromUserId'],
//       timestamp: query["timestamp"] ?? Timestamp.now(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'senderId': senderId,
//       'text': text,
//       'timestamp': timestamp,
//     };
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String senderId;
  final String text;
  // final String imageUrl;
  final Timestamp timestamp;

 const  Message({
    required this.id,
    required this.senderId,
    required this.text,
    // required this.imageUrl,
    required this.timestamp,
  });

  factory Message.fromQuerySnapshot(QueryDocumentSnapshot query) {
    return Message(
      id: query.id,
      senderId: query['sender-email'] ?? 'unknown',
      text: query['text'] ?? '',
      // imageUrl: query['image-url'] ?? '',
      timestamp: query['time-stamp'] ?? Timestamp.now(),
    );
  }
}