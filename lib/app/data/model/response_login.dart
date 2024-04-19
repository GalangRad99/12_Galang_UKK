/// status : 200
/// message : "Login Sukses"
/// data : {"id":2,"token":"5|iNkvfzTqZqQbflt0cjHZnjDZxZ9OqMwJKhNjCmja18f6eaa2","name":"diaz","password":"$2y$12$S57hFHcqyWd18BSDav5Vlu4L9XcWJr5RzxqKWpruUtuLgpJag2cPW"}

class ResponseLogin {
  ResponseLogin({
      this.status, 
      this.message, 
      this.data,});

  ResponseLogin.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 2
/// token : "5|iNkvfzTqZqQbflt0cjHZnjDZxZ9OqMwJKhNjCmja18f6eaa2"
/// name : "diaz"
/// password : "$2y$12$S57hFHcqyWd18BSDav5Vlu4L9XcWJr5RzxqKWpruUtuLgpJag2cPW"

class Data {
  Data({
      this.id, 
      this.token, 
      this.name, 
      this.password,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    password = json['password'];
  }
  int? id;
  String? token;
  String? name;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    map['name'] = name;
    map['password'] = password;
    return map;
  }

}