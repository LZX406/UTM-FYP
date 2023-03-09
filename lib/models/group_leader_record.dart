// ignore_for_file: camel_case_types, non_constant_identifier_names

class Group_leader {
  final String group_id;
  final String account_id;

  const Group_leader({this.group_id = '', this.account_id = ''});

  Group_leader.fromJson(Map<String, dynamic> json)
      : this(group_id: json['group_id'], account_id: json['account_id']);

  Map<String, dynamic> toJson() =>
      {'group_id': group_id, 'account_id': account_id};

  copyWith({group_id, account_id}) => Group_leader(
      group_id: group_id ?? this.group_id,
      account_id: account_id ?? this.account_id);
}
