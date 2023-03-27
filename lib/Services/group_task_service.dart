// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/Services/group_task_progress_service.dart';
import 'package:myapp/models/g_task.dart';
import 'package:myapp/models/group_member_record.dart';

class Group_task_service {
  final firestoreInstance = FirebaseFirestore.instance;
  void CreateGroupTask(
      {required List<Group_member?> memberlist,
      required userid,
      required task_nam,
      required enddate,
      required estidate,
      required link,
      required info,
      required progress,
      required startdate,
      required group_id}) {
    String doc = firestoreInstance.collection("GroupTask").doc().id;
    firestoreInstance.collection("GroupTask").doc(doc).set({
      'userid': userid,
      'task_nam': task_nam,
      'enddate': enddate,
      'estidate': estidate,
      'link': link,
      'task_id': doc,
      'info': info,
      'progress': progress,
      'startdate': startdate,
      'group_id': group_id,
      'activestate': true
    });
    for (var member in memberlist) {
      Group_task_progress_service().CreateGroupTaskProgress(
          username: member!.member_username,
          group_id: group_id,
          group_task_id: doc);
    }
  }

  String UpdateGroupTask({required Group_Task_record Task}) {
    try {
      firestoreInstance.collection("GroupTask").doc(Task.task_id).set({
        'userid': Task.userid,
        'task_nam': Task.task_nam,
        'enddate': Task.enddate,
        'estidate': Task.estidate,
        'link': Task.link,
        'task_id': Task.task_id,
        'info': Task.info,
        'progress': Task.progress,
        'startdate': Task.startdate,
        'activestate': Task.activestate
      }, SetOptions(merge: true));
    } catch (e) {
      return e.toString();
    }
    return "Update successful";
  }

  void UpdateGroupProgress({required num a, required String group_task_id}) {
    try {
      firestoreInstance.collection("GroupTask").doc(group_task_id).set({
        'progress': a.toInt(),
      }, SetOptions(merge: true));
    } catch (e) {
      print(e.toString());
    }
  }

  void updatestate({required Group_Task_record Task}) {
    firestoreInstance
        .collection("GroupTask")
        .doc(Task.task_id)
        .set({'activestate': Task.activestate}, SetOptions(merge: true));
  }

  Future<Group_Task_record?> GetSingleGroupTask(
      {required String taskid}) async {
    Group_Task_record? task;
    await firestoreInstance
        .collection("GroupTask")
        .where("task_id", isEqualTo: taskid)
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        task = Group_Task_record.fromMap(document.data());
      }
    });
    return task;
  }

  Future<List<Group_Task_record?>> GetGroupTask(
      {required String groupid}) async {
    Group_Task_record? task;
    List<Group_Task_record?> tasklist = [];
    await firestoreInstance
        .collection("GroupTask")
        .where("group_id", isEqualTo: groupid)
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        task = Group_Task_record.fromMap(document.data());
        tasklist.add(task);
      }
    });
    tasklist.sort(((a, b) {
      return a!.startdate!.compareTo(b!.startdate!);
    }));
    return tasklist;
  }

  String DeleteGroupTask({required task_id}) {
    try {
      firestoreInstance.collection("GroupTask").doc(task_id).delete();
    } catch (e) {
      return e.toString();
    }
    return "Delete successful";
  }

  Future<List<List<Group_Task_record?>?>> Getalltask({required groupid}) async {
    List<Group_Task_record?> Activetasklist = [];
    List<Group_Task_record?> Inactivetasklist = [];
    List<List<Group_Task_record?>?> Alltasklist = [];
    List<Group_Task_record?> tasklist = await GetGroupTask(groupid: groupid);
    for (Group_Task_record? task in tasklist) {
      if (task!.activestate == true && task.enddate!.isBefore(DateTime.now())) {
        task.setstate = false;
        updatestate(Task: task);
      } else if (task.activestate == false &&
          task.enddate!.isAfter(DateTime.now())) {
        task.setstate = true;
        updatestate(Task: task);
      }
      if (task.activestate == true) {
        Activetasklist.add(task);
      } else {
        Inactivetasklist.add(task);
      }
    }
    Alltasklist.add(Activetasklist);
    Alltasklist.add(Inactivetasklist);
    return Alltasklist;
  }

  Future<List<Group_Task_record?>> Getpasttask({required groupid}) async {
    List<Group_Task_record?> Inactivetasklist = [];
    List<Group_Task_record?> tasklist = await GetGroupTask(groupid: groupid);
    for (Group_Task_record? task in tasklist) {
      if (task!.activestate == true && task.enddate!.isBefore(DateTime.now())) {
        task.setstate = false;
        updatestate(Task: task);
      } else if (task.activestate == false &&
          task.enddate!.isAfter(DateTime.now())) {
        task.setstate = true;
        updatestate(Task: task);
      }
      if (task.activestate == false) {
        Inactivetasklist.add(task);
      }
    }
    return Inactivetasklist;
  }

  Future<List<Group_Task_record?>> Getcurrenttask({required groupid}) async {
    List<Group_Task_record?> Activetasklist = [];
    List<Group_Task_record?> tasklist = await GetGroupTask(groupid: groupid);
    for (Group_Task_record? task in tasklist) {
      if (task!.activestate == true && task.enddate!.isBefore(DateTime.now())) {
        task.setstate = false;
        updatestate(Task: task);
      } else if (task.activestate == false &&
          task.enddate!.isAfter(DateTime.now())) {
        task.setstate = true;
        updatestate(Task: task);
      }
      if (task.activestate == true) {
        Activetasklist.add(task);
      }
    }
    return Activetasklist;
  }
}
