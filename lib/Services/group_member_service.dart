// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/g_task_progress.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_member_record.dart';
import 'package:myapp/models/user.dart';

class Group_member_service {
  final firestoreInstance = FirebaseFirestore.instance;
  Future<List<User_Account?>> GetGroupMemberList(
      {required List<Group_task_progress?> progresslist}) async {
    User_Account? user;
    List<User_Account?> userlist = [];
    for (var progress in progresslist) {
      await firestoreInstance
          .collection("User")
          .doc(progress!.user_id)
          .get()
          .then((document) {
        user = User_Account.Map(document);
        userlist.add(user);
      });
    }
    return userlist;
  }

  Future<List<Group_member?>> GetGroupMember({required groupid}) async {
    List<Group_member?> memberlist = [];
    await firestoreInstance
        .collection("Group")
        .doc(groupid)
        .collection("member")
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        Group_member member = Group_member.fromMap(document.data());
        memberlist.add(member);
      }
    });
    return memberlist;
  }

  void UpdateMember(
      {required String groupid,
      required String userid,
      required int position}) {
    firestoreInstance
        .collection("Group")
        .doc(groupid)
        .collection("member")
        .doc(userid)
        .set({'memberposition': position}, SetOptions(merge: true));
  }

  String? RemoveMember({required Group group, required userid}) {
    try {
      firestoreInstance
          .collection("Group")
          .doc(group.group_id)
          .collection("member")
          .doc(userid)
          .delete();
    } catch (e) {
      return e.toString();
    }
    return "Delete successful";
  }
}
