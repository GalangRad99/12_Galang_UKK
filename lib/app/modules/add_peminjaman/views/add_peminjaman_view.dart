import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Silahkan isi data berikut'),
        centerTitle: true,
        backgroundColor: Color(0xFF00239F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Menampilkan judul buku
            Obx(
                  () => Text(
                'Judul: ${controller.book.value.judul}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24),
            // Menampilkan form input


            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Tanggal Pengembalian',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.tglKembaliController.value
            ),
            SizedBox(height: 24),
            Obx(
                  () => controller.loading.value
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: () => controller.post(),
                child: Text(
                  "Pinjam",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
