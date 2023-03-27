// ignore_for_file: non_constant_identifier_names

class Group {
  final String group_id;
  final String group_name;
  final String info;
  final String group_leader_id;

  const Group(
      {this.group_id = '',
      this.info = '',
      this.group_name = '',
      this.group_leader_id = ''});

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
