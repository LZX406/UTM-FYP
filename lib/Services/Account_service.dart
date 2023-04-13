// ignore_for_file: file_names, non_constant_identifier_names, avoid_types_as_parameter_names

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
      "ban": false,
      "lastlogin": DateTime.now(),
    });
  }

  Future<User_Account?> GetUser() async {
    User_Account? user;

    await firestoreInstance
        .collection("Admin")
        .doc(Auth().currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.exists) {
          user = User_Account.AdminMap(value.data()!);
        }
      },
    );
    await firestoreInstance
        .collection("User")
        .doc(Auth().currentUser!.uid)
        .get()
        .then(
      (value) async {
        if (value.exists) {
          user = User_Account.Map(value.data()!);
          firestoreInstance
              .collection("User")
              .doc(Auth().currentUser!.uid)
              .set({
            "lastlogin": DateTime.now(),
          }, SetOptions(merge: true));
        }
      },
    );
    return user;
  }

  Future<List<User_Account?>> GetAllUser() async {
    User_Account? user;
    List<User_Account?> userlist = [];
    await firestoreInstance.collection("User").get().then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        user = User_Account.Map(document.data());
        userlist.add(user);
      }
    });
    userlist.sort(((a, b) {
      return a!.username.compareTo(b!.username);
    }));

    return userlist;
  }

  void UpdateUser({required String username}) {
    firestoreInstance.collection("User").doc(Auth().currentUser!.uid).set({
      "username": username,
    }, SetOptions(merge: true));
  }

  void UpdateState({required User_Account user}) {
    if (user.ban == false) {
      firestoreInstance.collection("User").doc(user.uid).set({
        "ban": true,
      }, SetOptions(merge: true));
    } else {
      firestoreInstance.collection("User").doc(user.uid).set({
        "ban": false,
      }, SetOptions(merge: true));
    }
  }
}
