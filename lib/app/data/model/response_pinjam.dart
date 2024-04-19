/// data : [{"id":25,"user_id":"15","book_id":"1","tanggal_pinjam":"2024-04-01","tanggal_kembali":"2024-01-04","status":"DIPINJAM","created_at":"2024-04-01T01:55:38.000000Z","updated_at":"2024-04-01T01:55:38.000000Z","buku":{"id":1,"judul":"Yovan Master3","kategori_id":1,"penulis":"Yovan","penerbit":"Cireng","sinopsis":"Pada suatu hari seorang cry ireng sir melakukan perjalanan ke Heroic namun dia dibully oleh temannya karena masih stuck di Master Star 3","image":null,"tanggal_publikasi":"2024-02-01","created_at":"2024-02-20T08:46:31.000000Z","updated_at":"2024-02-20T08:46:31.000000Z"}}]

class ResponsePinjam {
  ResponsePinjam({
    this.data,});

  ResponsePinjam.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPinjam.fromJson(v));
      });
    }
  }
  List<DataPinjam>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 25
/// user_id : "15"
/// book_id : "1"
/// tanggal_pinjam : "2024-04-01"
/// tanggal_kembali : "2024-01-04"
/// status : "DIPINJAM"
/// created_at : "2024-04-01T01:55:38.000000Z"
/// updated_at : "2024-04-01T01:55:38.000000Z"
/// buku : {"id":1,"judul":"Yovan Master3","kategori_id":1,"penulis":"Yovan","penerbit":"Cireng","sinopsis":"Pada suatu hari seorang cry ireng sir melakukan perjalanan ke Heroic namun dia dibully oleh temannya karena masih stuck di Master Star 3","image":null,"tanggal_publikasi":"2024-02-01","created_at":"2024-02-20T08:46:31.000000Z","updated_at":"2024-02-20T08:46:31.000000Z"}

class DataPinjam {
  DataPinjam({
    this.id,
    this.userId,
    this.bookId,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.buku,});

  DataPinjam.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
  }
  int? id;
  String? userId;
  String? bookId;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? status;
  String? createdAt;
  String? updatedAt;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (buku != null) {
      map['buku'] = buku?.toJson();
    }
    return map;
  }

}

/// id : 1
/// judul : "Yovan Master3"
/// kategori_id : 1
/// penulis : "Yovan"
/// penerbit : "Cireng"
/// sinopsis : "Pada suatu hari seorang cry ireng sir melakukan perjalanan ke Heroic namun dia dibully oleh temannya karena masih stuck di Master Star 3"
/// image : null
/// tanggal_publikasi : "2024-02-01"
/// created_at : "2024-02-20T08:46:31.000000Z"
/// updated_at : "2024-02-20T08:46:31.000000Z"

class Buku {
  Buku({
    this.id,
    this.judul,
    this.kategoriId,
    this.penulis,
    this.penerbit,
    this.sinopsis,
    this.image,
    this.tanggalPublikasi,
    this.createdAt,
    this.updatedAt,});

  Buku.fromJson(dynamic json) {
    id = json['id'];
    judul = json['judul'];
    kategoriId = json['kategori_id'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    sinopsis = json['sinopsis'];
    image = json['image'];
    tanggalPublikasi = json['tanggal_publikasi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? judul;
  int? kategoriId;
  String? penulis;
  String? penerbit;
  String? sinopsis;
  dynamic image;
  String? tanggalPublikasi;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['judul'] = judul;
    map['kategori_id'] = kategoriId;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['sinopsis'] = sinopsis;
    map['image'] = image;
    map['tanggal_publikasi'] = tanggalPublikasi;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}