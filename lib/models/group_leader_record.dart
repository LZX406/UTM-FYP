// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:myapp/models/user.dart';

class Group_leader_record {
  final String group_id;
  final String leader_id;
  final String group_leader_id;
  final int member_type;
  User_Account? leader;

  Group_leader_record(
      {this.group_id = '',
      this.leader_id = '',
      this.group_leader_id = '',
      this.member_type = 0,
      this.leader});

  void addleader(User_Account leader) {
    this.leader = leader;
  }

  factory Group_leader_record.fromMap(map) {
    return Group_leader_record(
        group_id: map['group_id'],
        leader_id: map['leader_id'],
        group_leader_id: map['group_leader_id'],
        member_type: map['member_type']);
  }

  factory Group_leader_record.create(
      group_id, leader_id, group_leader_id, member_type) {
    return Group_leader_record(
        group_id: group_id,
        leader_id: leader_id,
        group_leader_id: group_leader_id,
        member_type: member_type);
  }

  Map<String, dynamic> toJson() => {
        'group_id': group_id,
        'leader_id': leader_id,
        'group_leader_id': group_leader_id,
        'member_type': member_type
      };
}
