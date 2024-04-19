import 'package:peminjam_perpustakaan_app/app/data/provider/storage_provider.dart';

class Endpoint {
  static const String baseUrlApi = "http://127.0.0.1:8000/api/";

  static const String register = "${baseUrlApi}register";
  static const String login = "${baseUrlApi}login";
  static const String buku = "${baseUrlApi}buku";
  static const String pinjam = "${baseUrlApi}pinjam";
  static const String DETAIL_BOOK = "${baseUrlApi}detail_book";
  static const String profile = "${baseUrlApi}profile";

}
