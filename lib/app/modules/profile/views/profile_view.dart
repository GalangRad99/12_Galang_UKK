import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/modules/profile/controllers/profile_controller.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text("PROFILE"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_rounded),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF9FADBC),
                  // Ubah warna latar belakang menjadi biru
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "galang",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Peminjam"),
                    SizedBox(height: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: const Color(0x624235),
                      ),
                      onPressed: () {
                        Get.toNamed(
                          Routes.PEMINJAMAN,
                        );
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Expanded(child: Text("Riwayat Peminjaman")),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        StorageProvider.clearAll();
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("LOG OUT", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
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
            currentIndex: 3,
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
}
