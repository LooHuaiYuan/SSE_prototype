class Lecturer_Authentication {
  String? id;
  String? userId;
  String? password;

  Lecturer_Authentication({this.id, this.userId, this.password});

  Lecturer_Authentication.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['password'] = this.password;
    return data;
  }
}