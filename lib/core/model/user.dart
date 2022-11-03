class User {
  User({
      this.user, 
      this.token,});

  User.fromJson(dynamic json) {
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    token = json['token'];
  }
  UserData? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class UserData {
  UserData({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  UserData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}