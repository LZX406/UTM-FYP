// ignore_for_file: camel_case_types, non_constant_identifier_names

class Group_member {
  final String member_id;
  int member_type;
  final String member_username;
  final String group_id;

  Group_member(
      {this.member_id = '',
      this.member_type = 0,
      this.member_username = '',
      this.group_id = ''});

  factory Group_member.fromMap(map) {
    return Group_member(
        member_id: map['member_id'],
        member_type: map['memberposition'],
        member_username: map['member_username'],
        group_id: map['group_id']);
  }

  factory Group_member.create(
      group_id, member_id, member_type, member_username) {
    return Group_member(
        member_id: member_id,
        member_type: member_type,
        member_username: member_username,
        group_id: group_id);
  }

  Map<String, dynamic> toJson() => {
        'member_id': member_id,
        'member_type': member_type,
        'member_username': member_username,
        'group_id': group_id
      };
}
