// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/p_task.dart';

class User_tasK_service {
  final firestoreInstance = FirebaseFirestore.instance;
  void CreateUserTask(
      {required userid,
      required task_nam,
      required enddate,
      required estidate,
      required link,
      required info,
      required progress,
      required startdate}) {
    String doc = firestoreInstance.collection("UserTask").doc().id;
    firestoreInstance.collection("UserTask").doc(doc).set({
      'userid': userid,
      'task_nam': task_nam,
      'enddate': enddate,
      'estidate': estidate,
      'link': link,
      'task_id': doc,
      'info': info,
      'progress': progress,
      'startdate': startdate,
      'activestate': true
    });
  }

  String UpdateUserTask({required Task_record Task}) {
    try {
      firestoreInstance.collection("UserTask").doc(Task.task_id).set({
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

  void updatestate({required Task_record Task}) {
    firestoreInstance
        .collection("UserTask")
        .doc(Task.task_id)
        .set({'activestate': Task.activestate}, SetOptions(merge: true));
  }

  Future<List<Task_record?>> GetUserTask({required String userid}) async {
    Task_record? task;
    List<Task_record?> tasklist = [];
    await firestoreInstance
        .collection("UserTask")
        .where("userid", isEqualTo: userid)
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        task = Task_record.fromMap(document.data());
        tasklist.add(task);
      }
    });
    tasklist.sort(((a, b) {
      return a!.startdate!.compareTo(b!.startdate!);
    }));
    return tasklist;
  }

  String DeleteUserTask({required task_id}) {
    try {
      firestoreInstance.collection("UserTask").doc(task_id).delete();
    } catch (e) {
      return e.toString();
    }
    return "Delete successful";
  }

  Future<List<List<Task_record?>?>> Getalltask({required userid}) async {
    List<Task_record?> Activetasklist = [];
    List<Task_record?> Inactivetasklist = [];
    List<List<Task_record?>?> Alltasklist = [];
    List<Task_record?> tasklist = await GetUserTask(userid: userid);
    for (Task_record? task in tasklist) {
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
}
