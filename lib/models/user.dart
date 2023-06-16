class Users {
  String id;
  String username;
  String alamat;
  String email;
  String password;

  Users({
    this.id = '',
    required this.username,
    required this.alamat,
    required this.email,
    required this.password
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "alamat": alamat,
    "email": email,
    "password": password
  };

  static Users fromJson(Map<dynamic, dynamic> json) => Users(
    id: json['id'],
    username: json['username'],
    alamat: json['alamat'],
    email: json['email'],
    password: json['password']
  );
}
