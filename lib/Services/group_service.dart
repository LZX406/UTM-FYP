// ignore_for_file: non_constant_identifier_names, camel_case_types, avoid_types_as_parameter_names, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/Services/group_task_service.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/models/group_member_record.dart';
import 'package:myapp/models/user.dart';

class Group_service {
  final firestoreInstance = FirebaseFirestore.instance;
  Future<String> CreateGroup({
    required userid,
    required group_nam,
    required info,
    required List<Group_member?> member_list,
  }) async {
    try {
      String group = firestoreInstance.collection("Group").doc().id;
      String doc = firestoreInstance.collection("Group_leader").doc().id;
      firestoreInstance.collection("Group").doc(group).set({
        'group_id': group,
        'group_name': group_nam,
        'info': info,
        'group_leader_id': doc
      });
      firestoreInstance.collection("Group_leader").doc(doc).set({
        'leader_id': userid,
        'group_id': group,
        'group_leader_id': doc,
        'member_type': 0,
      });
      if (member_list.isNotEmpty) {
        for (var member in member_list) {
          User_Account? user;
          await firestoreInstance
              .collection("User")
              .where("username", isEqualTo: member!.member_username)
              .get()
              .then((QuerySnapshot) {
            if (QuerySnapshot.docs.isNotEmpty) {
              for (var document in QuerySnapshot.docs) {
                user = User_Account.Map(document.data());
              }
            }
          });
          firestoreInstance
              .collection("Group")
              .doc(group)
              .collection("member")
              .doc(user!.uid)
              .set({
            'member_id': user!.uid,
            'member_username': user!.username,
            'memberposition': 1,
            'group_id': group
          });
        }
      }
    } catch (e) {
      return e.toString();
    }
    return "Create successful";
  }

  String UpdateGroup({
    required Group group,
    required List<Group_member?> member_list,
  }) {
    try {
      firestoreInstance.collection("Group").doc(group.group_id).set({
        'group_name': group.group_name,
        'info': group.info,
      }, SetOptions(merge: true));
      if (member_list.isNotEmpty) {
        for (var member in member_list) {
          if (member!.member_username == "new") {
            firestoreInstance
                .collection("Group")
                .doc(group.group_id)
                .collection("member")
                .doc(member.member_id)
                .set({
              'member_id': member.member_id,
              'group_id': group,
              'memberposition': member.member_type,
            }, SetOptions(merge: true));
          }
          firestoreInstance
              .collection("Group")
              .doc(group.group_id)
              .collection("member")
              .doc(member.member_id)
              .set({
            'memberposition': member.member_type,
          }, SetOptions(merge: true));
        }
      }
    } catch (e) {
      return e.toString();
    }
    return "Update successful";
  }

  Future<List<Group?>> GetAllGroup() async {
    Group? group;
    List<Group?> grouplist = [];
    User_Account? user;
    Group_leader_record? groupleader;

    await firestoreInstance.collection("Group").get().then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        group = Group.fromMap(document.data());
        grouplist.add(group);
      }
    });
    for (var group in grouplist) {
      List<Group_member?> memberlist = [];
      await firestoreInstance
          .collection("Group")
          .doc(group!.group_id)
          .collection("member")
          .get()
          .then((QuerySnapshot) {
        for (var document in QuerySnapshot.docs) {
          Group_member member = Group_member.fromMap(document.data());
          memberlist.add(member);
        }
        group.addgroupmember(memberlist);
      });
    }
    await firestoreInstance
        .collection("Group_leader")
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        groupleader = Group_leader_record.fromMap(document.data());
        for (var group in grouplist) {
          if (group!.group_leader_id == groupleader!.group_leader_id) {
            group.addgroupleader(groupleader!);
          }
        }
      }
    });

    for (var leader in grouplist) {
      await firestoreInstance
          .collection("User")
          .doc(leader!.group_leader!.leader_id)
          .get()
          .then((value) async {
        if (value.exists) {
          user = User_Account.Map(value.data()!);
          leader.group_leader!.addleader(user!);
        }
      });
    }
    grouplist.sort(((a, b) {
      return a!.group_name.compareTo(b!.group_name);
    }));

    return grouplist;
  }

  Future<List<Group?>> GetGroup({required String userid}) async {
    Group? group;
    List<Group?> grouplist = [];
    Group_leader_record? groupleader;
    List<Group_leader_record?> groupleaderlist = [];
    Group_member? member;
    User_Account? user;
    List<Group_member?> memberlist = [];
    await firestoreInstance
        .collection("Group_leader")
        .where("leader_id", isEqualTo: userid)
        .get()
        .then((QuerySnapshot) {
      for (var document in QuerySnapshot.docs) {
        groupleader = Group_leader_record.fromMap(document.data());
        groupleaderlist.add(groupleader);
      }
    });
    if (groupleaderlist.isNotEmpty) {
      for (var a in groupleaderlist) {
        await firestoreInstance
            .collection("Group")
            .where("group_id", isEqualTo: a!.group_id)
            .get()
            .then((QuerySnapshot) {
          for (var document in QuerySnapshot.docs) {
            group = Group.fromMap(document.data());
            group!.addgroupleader(a);
            grouplist.add(group);
          }
        });
      }
    }
    await firestoreInstance
        .collection("Group")
        .get()
        .then((QuerySnapshot) async {
      for (var document in QuerySnapshot.docs) {
        await firestoreInstance
            .collection("Group")
            .doc(document.id)
            .collection("member")
            .doc(userid)
            .get()
            .then((value) {
          if (value.exists) {
            member = Group_member.fromMap(value.data());
            memberlist.add(member);
          }
        });
        if (memberlist.isNotEmpty) {
          for (var member in memberlist) {
            Group? group =
                await Group_service().GetSingleGroup(groupid: member!.group_id);
            grouplist.add(group);
          }
          memberlist = [];
        }
        for (var leader in grouplist) {
          await firestoreInstance
              .collection("User")
              .doc(leader!.group_leader!.leader_id)
              .get()
              .then((value) async {
            if (value.exists) {
              user = User_Account.Map(value.data()!);
              leader.group_leader!.addleader(user!);
            }
          });
        }
        if (grouplist.length >= 2) {
          grouplist.sort(((a, b) {
            return a!.group_name.compareTo(b!.group_name);
          }));
        }
      }
    });
    return grouplist;
  }

  Future<Group?> GetSingleGroup({required groupid}) async {
    Group? group;
    Group_leader_record? group_leader;
    await firestoreInstance
        .collection("Group")
        .doc(groupid)
        .get()
        .then((value) {
      group = Group.fromMap(value.data());
    });
    await firestoreInstance
        .collection("Group_leader")
        .where("group_id", isEqualTo: groupid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var groupleader in value.docs) {
          group_leader = Group_leader_record.fromMap(groupleader);
        }
        group!.addgroupleader(group_leader!);
      }
    });
    return group;
  }

  Future<Group_leader_record?> GetSingleGroupleader(
      {required Group group}) async {
    Group_leader_record? groupleader;
    try {
      await firestoreInstance
          .collection("Group_leader")
          .doc(group.group_leader_id)
          .get()
          .then((value) {
        groupleader = Group_leader_record.fromMap(value.data());
      });
    } catch (e) {}
    return groupleader;
  }

  Future<String?> DeleteGroup({required Group group, required userid}) async {
    try {
      await firestoreInstance
          .collection("GroupTask")
          .where("group_id", isEqualTo: group.group_id)
          .get()
          .then((QuerySnapshot) {
        for (var document in QuerySnapshot.docs) {
          Group_task_service().DeleteGroupTask(task_id: document.id);
        }
      });
      await firestoreInstance
          .collection("Group")
          .doc(group.group_id)
          .collection("member")
          .get()
          .then((QuerySnapshot) async {
        if (QuerySnapshot.docs.isNotEmpty) {
          for (var document in QuerySnapshot.docs) {
            await firestoreInstance
                .collection("Group")
                .doc(group.group_id)
                .collection("member")
                .doc(document.id)
                .delete();
          }
        }
      });
      await firestoreInstance.collection("Group").doc(group.group_id).delete();
      await firestoreInstance
          .collection("Group_leader")
          .doc(group.group_leader_id)
          .delete();
    } catch (e) {
      return e.toString();
    }
    return "Delete successful";
  }

  Future<User_Account?> Check(String username) async {
    User_Account? user;
    await firestoreInstance
        .collection("User")
        .where("username", isEqualTo: username)
        .get()
        .then((QuerySnapshot) {
      if (QuerySnapshot.docs.isNotEmpty) {
        for (var document in QuerySnapshot.docs) {
          user = User_Account.Map(document.data());
        }
      }
    });
    return user;
  }

  Future<String?> CheckUser(String username, Group group) async {
    User_Account? user;
    String? message;
    try {
      await firestoreInstance
          .collection("User")
          .where("username", isEqualTo: username)
          .get()
          .then((QuerySnapshot) {
        for (var document in QuerySnapshot.docs) {
          user = User_Account.Map(document.data());
        }
      });
    } catch (e) {
      message = e.toString();
    }
    if (user?.username != null) {
      try {
        firestoreInstance
            .collection("Group")
            .doc(group.group_id)
            .collection("member")
            .doc(user!.uid)
            .set({
          'member_id': user!.uid,
          'member_username': user!.username,
          'memberposition': 1,
          'group_id': group.group_id
        });
        message = "User exist";
      } catch (e) {
        message = e.toString();
      }
    } else {
      message = "User not exist";
    }
    return message;
  }

  Future<String?> AddUser(User_Account? user, Group group) async {
    String? message;
    try {
      await firestoreInstance
          .collection("Group")
          .doc(group.group_id)
          .collection("member")
          .doc(user!.uid)
          .set({
        'member_id': user.uid,
        'member_username': user.username,
        'memberposition': 1,
        'group_id': group.group_id
      }).then((value) {
        message = "User exist";
      });
    } catch (e) {
      message = e.toString();
    }
    return message;
  }
}
