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
      "countrycode": '',
      "phonenum": '',
      "completephonenum": '',
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
      (value) async {
        if (value.exists) {
          user = User_Account.AdminMap(value.data()!);
          return user;
        } else {
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
        }
      },
    );

    return user;
  }

  Future<User_Account?> GetProfile({required String uid}) async {
    User_Account? user;

    await firestoreInstance.collection("User").doc(uid).get().then(
      (value) async {
        if (value.exists) {
          user = User_Account.Map(value.data()!);
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

  String UpdateUser(
      {required String username,
      required String countrycode,
      required String phonenum,
      required String completephonenum}) {
    try {
      firestoreInstance.collection("User").doc(Auth().currentUser!.uid).set({
        "username": username,
        "phonenum": phonenum,
        "countrycode": countrycode,
        "completephonenum": completephonenum,
      }, SetOptions(merge: true));
    } catch (e) {
      return e.toString();
    }
    return "Update successful";
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

  Future<bool?> Checkuserexist(String username) async {
    bool? exist = false;
    await firestoreInstance
        .collection("User")
        .where("username", isEqualTo: username)
        .get()
        .then((QuerySnapshot) {
      if (QuerySnapshot.docs.isNotEmpty) {
        exist = true;
      } else if (username == 'Admin') {
        exist = true;
      }
    });
    return exist;
  }

  Future<bool?> Checkemailexist(String email) async {
    bool? exist = false;
    await firestoreInstance
        .collection("User")
        .where("email", isEqualTo: email)
        .get()
        .then((QuerySnapshot) {
      if (QuerySnapshot.docs.isNotEmpty) {
        exist = true;
      }
    });
    return exist;
  }
}
