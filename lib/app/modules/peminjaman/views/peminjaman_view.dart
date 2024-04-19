import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: controller.obx(
          (state) => ListView.separated(
            itemCount: state!.length,
            itemBuilder: (ctx, index) {
              return _buildPeminjamanTile(state[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00239F), Color(0xFF011147)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: 2,
            // index dari item yang sedang terpilih
            onTap: (int index) {
              // Tambahkan logika untuk mengarahkan ke halaman yang sesuai dengan item yang dipilih
              if (index == 0) {
                Get.toNamed(Routes.HOME);
              } else if (index == 1) {
                Get.toNamed(Routes.BOOK);
              } else if (index == 2) {
                Get.toNamed(Routes.PEMINJAMAN);
              } else if (index == 3) {
                Get.toNamed(Routes.PROFILE);
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.cyanAccent,
            // Warna teks label yang terpilih
            unselectedItemColor: Colors.white,
            // Warna teks label yang tidak terpilih
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Buku',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: 'Peminjaman',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ));
  }

  Widget _buildPeminjamanTile(dynamic peminjaman) {
    // Access data from the peminjaman object as needed (e.g., peminjaman.buku?.judul)
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
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
        child: ListTile(
          title: Text("${peminjaman.buku?.judul}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Penulis: ${peminjaman.buku?.penulis}"),
              Text("Tanggal Pinjam: ${peminjaman.tanggalPinjam}"),
              Text("Tanggal Kembali: ${peminjaman.tanggalKembali}"),
            ],
          ),
          trailing: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${peminjaman.status}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
