// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/g_task.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/models/group_member_record.dart';
import 'package:myapp/models/user.dart';

class Notification_service {
  final firestoreInstance = FirebaseFirestore.instance;

  void Update_group_task_detail_Notification({
    required User_Account User,
    required Group group,
    required List<User_Account?> user_list,
    required Group_Task_record group_task,
  }) {
    for (var user in user_list) {
      firestoreInstance.collection("Notification").doc().set({
        "title":
            "${group.group_name}'s ${group_task.task_nam} task detail updated",
        "body":
            "${User.username} has update ${group.group_name}'s ${group_task.task_nam} task detail!",
        "user_id": user!.uid
      });
    }
    firestoreInstance.collection("Notification").doc().set({
      "title":
          "${group.group_name}'s ${group_task.task_nam} task detail updated",
      "body":
          "${User.username} has update ${group.group_name}'s ${group_task.task_nam} task detail!",
      "user_id": User.uid
    });
  }

  void Update_group_detail_Notification({
    required User_Account User,
    required Group group,
    required List<User_Account?> user_list,
  }) {
    for (var user in user_list) {
      firestoreInstance.collection("Notification").doc().set({
        "title": "${group.group_name} detail updated",
        "body": "${User.username} has update ${group.group_name} detail!",
        "user_id": user!.uid
      });
    }
    firestoreInstance.collection("Notification").doc().set({
      "title": "${group.group_name} detail updated",
      "body": "${User.username} has update ${group.group_name} detail!",
      "user_id": User.uid
    });
  }

  void Update_group_task_complete_Notification({
    required Group_leader_record group_leader,
    required Group group,
    required List<Group_member?> user_list,
    required Group_Task_record group_task,
  }) {
    for (var user in user_list) {
      firestoreInstance.collection("Notification").doc().set({
        "title": "${group.group_name}'s task complete",
        "body": "${group_task.task_nam} complete!",
        "user_id": user!.member_id
      });
    }
    firestoreInstance.collection("Notification").doc().set({
      "title": "${group.group_name}'s task complete",
      "body": "${group_task.task_nam} complete!",
      "user_id": group_leader.leader_id
    });
  }

  void Update_group_new_task_Notification({
    required User_Account User,
    required Group group,
    required List<Group_member?> user_list,
  }) {
    for (var user in user_list) {
      firestoreInstance.collection("Notification").doc().set({
        "title": "${group.group_name}'s new task",
        "body": "A new task has been created!",
        "user_id": user!.member_id
      });
    }
    firestoreInstance.collection("Notification").doc().set({
      "title": "${group.group_name}'s new task",
      "body": "A new task has been created!",
      "user_id": User.uid
    });
  }
}
