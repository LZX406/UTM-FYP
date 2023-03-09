// ignore_for_file: non_constant_identifier_names

class Group {
  final String group_id;
  final String name;
  final String info;

  const Group({this.group_id = '', this.info = '', this.name = ''});

  Group.fromJson(Map<String, dynamic> json)
      : this(
            group_id: json['group_id'], info: json['info'], name: json['name']);

  Map<String, dynamic> toJson() =>
      {'group_id': group_id, 'name': name, 'info': info};

  copyWith({group_id, name, info}) => Group(
      group_id: group_id ?? this.group_id,
      name: name ?? this.name,
      info: info ?? this.info);
}
