// ignore_for_file: camel_case_types, non_constant_identifier_names

class Group_member {
  final String group_id;
  final String account_id;
  final int member_type;

  const Group_member(
      {this.group_id = '', this.account_id = '', this.member_type = 0});

  Group_member.fromJson(Map<String, dynamic> json)
      : this(
            group_id: json['group_id'],
            account_id: json['account_id'],
            member_type: json['member_type']);

  Map<String, dynamic> toJson() => {
        'group_id': group_id,
        'account_id': account_id,
        'member_type': member_type
      };

  copyWith({group_id, account_id, member_type}) => Group_member(
      group_id: group_id ?? this.group_id,
      account_id: account_id ?? this.account_id,
      member_type: member_type ?? this.member_type);
}
