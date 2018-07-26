class User {
  final int userId;
  final String name;
  final String surname;
  final String token;
  User({this.userId, this.name, this.surname, this.token});
    factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      name: json['name'],
      surname: json['surname'],
      token: json['token'],
    );
    }
}