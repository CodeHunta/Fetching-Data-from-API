class User {
  int id;
  String name, email, username, phone;

  User(this.id, this.name, this.email, this.username, this.phone);

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        username = json['username'],
        phone = json['phone'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'phone': phone
    };
  }
}
