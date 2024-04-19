import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Peminjaman View'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.tglKembaliController,
                  decoration: InputDecoration(
                    hintText: "Masukkan Tanggal Kembali",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tanggal Kembali tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Obx(() {
                  print('value : ${controller.tglKembaliController.text}');
                  return controller.loading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () => controller.post(),
                    child: const Text("Pinjam"),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
