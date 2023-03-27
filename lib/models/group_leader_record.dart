// ignore_for_file: camel_case_types, non_constant_identifier_names

class Group_leader {
  final String group_id;
  final String leader_id;
  final String group_leader_id;
  final int member_type;

  Group_leader(
      {this.group_id = '',
      this.leader_id = '',
      this.group_leader_id = '',
      this.member_type = 0});

  factory Group_leader.fromMap(map) {
    return Group_leader(
        group_id: map['group_id'],
        leader_id: map['leader_id'],
        group_leader_id: map['group_leader_id'],
        member_type: map['member_type']);
  }

  factory Group_leader.create(
      group_id, leader_id, group_leader_id, member_type) {
    return Group_leader(
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
