import 'package:chat/services/chat_firebase_sevices.dart';
import 'package:chat/services/user_firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  final _chatFirebaseServices = UserFirebaseServices();

  Stream<QuerySnapshot> get list {
    return _chatFirebaseServices.getUsers();
  }
}
