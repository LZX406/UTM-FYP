// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/models/user.dart';

class Accountservice {
  final firestoreInstance = FirebaseFirestore.instance;
  void CreateUser(
      {required String email,
      required String password,
      required String username}) {
    firestoreInstance.collection("User").doc(Auth().currentUser!.uid).set({
      "email": email,
      "username": username,
      "password": password,
      "uid": Auth().currentUser!.uid,
    });
  }

  Future<User_Account?> GetUser() async {
    User_Account? user;
    await firestoreInstance
        .collection("User")
        .doc(Auth().currentUser!.uid)
        .get()
        .then(
          (value) => user = User_Account.fromMap(value.data()!),
        );
    return user;
  }

  void UpdateUser({required String username}) {
    firestoreInstance.collection("User").doc(Auth().currentUser!.uid).set({
      "username": username,
    });
  }
}
