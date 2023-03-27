// ignore_for_file: camel_case_types, non_constant_identifier_names

class User_Account {
  final String password;
  final String email;
  final String username;
  final String uid;

  const User_Account(
      {this.password = '', this.email = '', this.username = '', this.uid = ''});

  factory User_Account.fromMap(map) {
    return User_Account(
      email: map['email'],
      password: map['password'],
      uid: map['uid'],
      username: map['username'],
    );
  }

  factory User_Account.Map(map) {
    return User_Account(
      email: map['email'],
      username: map['username'],
      uid: map['uid'],
    );
  }

  factory User_Account.create(map) {
    return User_Account(
      email: map['email'],
      password: map['password'],
      uid: map['uid'],
      username: map['username'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'password': password, 'email': email, 'username': username, 'id': uid};

  copyWith({username, password, email, id}) => User_Account(
      password: password ?? this.password,
      email: email ?? this.email,
      username: username ?? this.username,
      uid: id ?? uid);
}
