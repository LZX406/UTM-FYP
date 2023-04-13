// ignore_for_file: non_constant_identifier_names

import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/models/group_member_record.dart';

class Group {
  final String group_id;
  final String group_name;
  final String info;
  final String group_leader_id;
  Group_leader? group_leader;
  List<Group_member?>? memberlist;

  Group(
      {this.group_id = '',
      this.info = '',
      this.group_name = '',
      this.group_leader_id = '',
      this.group_leader});

  void addgroupleader(Group_leader group_leader) {
    this.group_leader = group_leader;
  }

  void addgroupmember(List<Group_member?> groupmember) {
    memberlist = groupmember;
  }

  factory Group.fromMap(map) {
    return Group(
        group_id: map['group_id'],
        info: map['info'],
        group_name: map['group_name'],
        group_leader_id: map['group_leader_id']);
  }

  Map<String, dynamic> toJson() => {
        'group_id': group_id,
        'group_name': group_name,
        'info': info,
        'group_leader_id': group_leader_id
      };

  factory Group.create(group_id, group_name, info, group_leader_id) {
    return Group(
        group_id: group_id,
        group_name: group_name,
        info: info,
        group_leader_id: group_leader_id);
  }
}
