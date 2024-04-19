/// status : 200
/// message : "DataDetailBook Ditemukan"
/// data : [{"id":1,"judul":"Maling Kondang","kategori_id":1,"penulis":"Atta Gledek","penerbit":"Geng Petir","image":"http://127.0.0.1:8000/images/1708477442.png","status":"TERSEDIA","tanggal_publikasi":"2020-01-20","kategori":{"id":1,"kategori":"Petualangan","created_at":"2024-01-30T10:08:20.000000Z","updated_at":"2024-01-30T10:08:20.000000Z"},"ulasan":[{"id":1,"user_id":1,"book_id":1,"ulasan":"Bukunya bagus sekali","rating":5,"updated_at":"2024-03-05T03:59:55.000000Z","created_at":"2024-03-05T03:59:55.000000Z","user":{"id":1,"name":"aji","email":"bagus@gmail.com","email_verified_at":null,"created_at":"2024-01-22T17:18:08.000000Z","updated_at":"2024-01-22T17:18:08.000000Z"}}]}]

class ResponseDetailbook {
  ResponseDetailbook({
    this.status,
    this.message,
    this.data,});

  ResponseDetailbook.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataDetailBook.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  List<DataDetailBook>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// judul : "Maling Kondang"
/// kategori_id : 1
/// penulis : "Atta Gledek"
/// penerbit : "Geng Petir"
/// image : "http://127.0.0.1:8000/images/1708477442.png"
/// status : "TERSEDIA"
/// tanggal_publikasi : "2020-01-20"
/// kategori : {"id":1,"kategori":"Petualangan","created_at":"2024-01-30T10:08:20.000000Z","updated_at":"2024-01-30T10:08:20.000000Z"}
/// ulasan : [{"id":1,"user_id":1,"book_id":1,"ulasan":"Bukunya bagus sekali","rating":5,"updated_at":"2024-03-05T03:59:55.000000Z","created_at":"2024-03-05T03:59:55.000000Z","user":{"id":1,"name":"aji","email":"bagus@gmail.com","email_verified_at":null,"created_at":"2024-01-22T17:18:08.000000Z","updated_at":"2024-01-22T17:18:08.000000Z"}}]

class DataDetailBook {
  DataDetailBook({
    this.id,
    this.judul,
    this.kategoriId,
    this.penulis,
    this.penerbit,
    this.sinopsis,
    this.image,
    this.status,
    this.tanggalPublikasi,
    this.kategori,
    this.ulasan,});

  DataDetailBook.fromJson(dynamic json) {
    id = json['id'];
    judul = json['judul'];
    kategoriId = json['kategori_id'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    sinopsis = json['sinopsis'];
    image = json['image'];
    status = json['status'];
    tanggalPublikasi = json['tanggal_publikasi'];
    kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
    if (json['ulasan'] != null) {
      ulasan = [];
      json['ulasan'].forEach((v) {
        ulasan?.add(Ulasan.fromJson(v));
      });
    }
  }
  int? id;
  String? judul;
  int? kategoriId;
  String? penulis;
  String? penerbit;
  String? sinopsis;
  String? image;
  String? status;
  String? tanggalPublikasi;
  Kategori? kategori;
  List<Ulasan>? ulasan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['judul'] = judul;
    map['kategori_id'] = kategoriId;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['sinopsis'] = sinopsis;
    map['image'] = image;
    map['status'] = status;
    map['tanggal_publikasi'] = tanggalPublikasi;
    if (kategori != null) {
      map['kategori'] = kategori?.toJson();
    }
    if (ulasan != null) {
      map['ulasan'] = ulasan?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// user_id : 1
/// book_id : 1
/// ulasan : "Bukunya bagus sekali"
/// rating : 5
/// updated_at : "2024-03-05T03:59:55.000000Z"
/// created_at : "2024-03-05T03:59:55.000000Z"
/// user : {"id":1,"name":"aji","email":"bagus@gmail.com","email_verified_at":null,"created_at":"2024-01-22T17:18:08.000000Z","updated_at":"2024-01-22T17:18:08.000000Z"}

class Ulasan {
  Ulasan({
    this.id,
    this.userId,
    this.bookId,
    this.ulasan,
    this.rating,
    this.updatedAt,
    this.createdAt,
    this.user,});

  Ulasan.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    ulasan = json['ulasan'];
    rating = json['rating'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? id;
  int? userId;
  int? bookId;
  String? ulasan;
  int? rating;
  String? updatedAt;
  String? createdAt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['ulasan'] = ulasan;
    map['rating'] = rating;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "aji"
/// email : "bagus@gmail.com"
/// email_verified_at : null
/// created_at : "2024-01-22T17:18:08.000000Z"
/// updated_at : "2024-01-22T17:18:08.000000Z"

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,});

  User.fromJson(dynamic json) {
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
  dynamic emailVerifiedAt;
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

/// id : 1
/// kategori : "Petualangan"
/// created_at : "2024-01-30T10:08:20.000000Z"
/// updated_at : "2024-01-30T10:08:20.000000Z"

class Kategori {
  Kategori({
    this.id,
    this.kategori,
    this.createdAt,
    this.updatedAt,});

  Kategori.fromJson(dynamic json) {
    id = json['id'];
    kategori = json['kategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? kategori;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['kategori'] = kategori;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}