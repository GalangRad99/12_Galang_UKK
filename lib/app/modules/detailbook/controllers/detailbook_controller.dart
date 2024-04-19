import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_app/app/data/model/response_detailbook.dart';
import 'package:peminjam_perpustakaan_app/app/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_app/app/data/model/response_detailbook.dart';
import 'package:peminjam_perpustakaan_app/app/data/provider/api_provider.dart';

class DetailbookController extends GetxController with StateMixin<List<DataDetailBook>> {
  late int id;
  final count = 0.obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    id = int.tryParse(Get.parameters['id'] ?? "0") ?? 0;
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.buku + "/$id");
      if (response.statusCode == 200) {
        final ResponseDetailbook responseBook = ResponseDetailbook.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioError catch (e) {
      change(null, status: RxStatus.error("Error ${e.message}"));
    } catch (e) {
      change(null, status: RxStatus.error("Error : $e"));
    }
  }
}