class User {
  int id;
  String name, email, username, phone, city;

  User(this.id, this.name, this.email, this.username, this.phone, this.city);

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        username = json['username'],
        phone = json['phone'],
        city = json['address'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'phone': phone,
      'address': city,
    };
  }
}
