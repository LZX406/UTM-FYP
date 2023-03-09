class User {
  final String password;
  final String email;
  final String username;
  final String id;

  const User(
      {this.password = '', this.email = '', this.username = '', this.id = ''});

  User.fromJson(Map<String, dynamic> json)
      : this(
            password: json['password'],
            email: json['email'],
            username: json['username'],
            id: json['id']);

  Map<String, dynamic> toJson() =>
      {'password': password, 'email': email, 'username': username, 'id': id};

  copyWith({username, password, email, id}) => User(
      password: password ?? this.password,
      email: email ?? this.email,
      username: username ?? this.username,
      id: id ?? this.id);
}
