// ignore_for_file: non_constant_identifier_names, camel_case_types, avoid_types_as_parameter_names

import 'package:myapp/PERT_analysis/pert.dart';
import 'package:myapp/Services/group_task_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/g_task.dart';
import 'package:myapp/models/g_task_progress.dart';
import 'package:myapp/models/user.dart';

class Group_task_progress_service {
  final firestoreInstance = FirebaseFirestore.instance;

  void CreateGroupTaskProgress(
      {required username, required group_task_id, required group_id}) {
    String? userid;
    firestoreInstance
        .collection("User")
        .where('username', isEqualTo: username)
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        userid = User_Account.Map(document.data()).uid;
      }
    }).then((value) {
      String doc = firestoreInstance
          .collection("GroupTask")
          .doc(group_task_id)
          .collection("GroupTaskProgress")
          .doc()
          .id;
      firestoreInstance
          .collection("GroupTask")
          .doc(group_task_id)
          .collection("GroupTaskProgress")
          .doc(doc)
          .set({
        'user_id': userid,
        'group_task_progress_id': doc,
        'group_task_id': group_task_id,
        'group_id': group_id,
        'progress': 0,
        'task_involved': true,
      });
    });
  }

  Future<List<Group_task_progress?>> GetGroupProgress(
      {required String group_task_id}) async {
    Group_task_progress? progress;
    List<Group_task_progress?> progresslist = [];
    await firestoreInstance
        .collection("GroupTask")
        .doc(group_task_id)
        .collection("GroupTaskProgress")
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        progress = Group_task_progress.fromMap(document.data());
        progresslist.add(progress);
      }
    });
    if (progresslist.isNotEmpty) {
      progresslist.sort(((a, b) {
        return a!.progress.compareTo(b!.progress);
      }));
    }

    return progresslist;
  }

  Future<Group_task_progress?> GetMemberProgress(
      {required String group_task_id, required String userid}) async {
    Group_task_progress? progress;
    await firestoreInstance
        .collection("GroupTask")
        .doc(group_task_id)
        .collection("GroupTaskProgress")
        .where("userid", isEqualTo: userid)
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        progress = Group_task_progress.fromMap(document.data());
      }
    });
    return progress;
  }

  Future<String> UpdateGroupTaskProgress(
      {required Group_Task_record grouptask,
      required Group_task_progress progress,
      required Group_task_progress newprogress}) async {
    try {
      firestoreInstance
          .collection("GroupTask")
          .doc(grouptask.task_id)
          .collection("GroupTaskProgress")
          .doc(progress.group_task_progress_id)
          .set({
        'progress': newprogress.progress,
        'task_involved': newprogress.task_involved,
      }, SetOptions(merge: true));
      num newprogressvalue = 0;
      await firestoreInstance
          .collection("GroupTask")
          .doc(grouptask.task_id)
          .collection("GroupTaskProgress")
          .where("task_involved", isEqualTo: true)
          .get()
          .then((QuerySnapshot) {
        for (var document in QuerySnapshot.docs) {
          newprogressvalue += document.get("progress");
        }
        if (QuerySnapshot.docs.isNotEmpty) {
          newprogressvalue = newprogressvalue / QuerySnapshot.docs.length;
        }
      });
      DateTime esti =
          estimate(grouptask.startdate!, grouptask.enddate!, newprogressvalue);
      Group_task_service().UpdateGroupProgress(
          a: newprogressvalue, group_task_id: grouptask.task_id, esti: esti);
    } catch (e) {
      return e.toString();
    }
    return "Update successful";
  }

  void DeleteGroupTaskProgress(
      {required Group_task_progress progress, required group_task_id}) {
    try {
      firestoreInstance
          .collection("GroupTask")
          .doc(group_task_id)
          .collection("GroupTaskProgress")
          .doc(progress.group_task_progress_id)
          .delete();
    } catch (e) {
      throw "already delete";
    }
  }

  Future<void> updatestate({
    required Group_Task_record grouptask,
    required Group_task_progress progress,
  }) async {
    bool value;
    if (progress.task_involved == true) {
      value = false;
    } else {
      value = true;
    }

    firestoreInstance
        .collection("GroupTask")
        .doc(grouptask.task_id)
        .collection("GroupTaskProgress")
        .doc(progress.group_task_progress_id)
        .set({
      'task_involved': value,
    }, SetOptions(merge: true));
    num newprogressvalue = 0;
    await firestoreInstance
        .collection("GroupTask")
        .doc(grouptask.task_id)
        .collection("GroupTaskProgress")
        .where("task_involved", isEqualTo: true)
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        newprogressvalue += document.get("progress");
      }
      if (QuerySnapshot.docs.isNotEmpty) {
        newprogressvalue = newprogressvalue / QuerySnapshot.docs.length;
      }
    });
    DateTime esti =
        estimate(grouptask.startdate!, grouptask.enddate!, newprogressvalue);
    Group_task_service().UpdateGroupProgress(
        a: newprogressvalue, group_task_id: grouptask.task_id, esti: esti);
  }
}
