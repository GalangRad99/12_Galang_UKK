import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15.0), // Menambahkan padding kiri dan kanan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30), // Menambahkan padding vertikal untuk membuat ukuran lebih besar
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF011147), Color(0xFF00239F)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Text(
                'Daftar Buku',
                style: TextStyle(
                  fontSize: 32, // Mengubah ukuran teks menjadi lebih besar
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                // Perbarui teks pencarian saat teks input berubah
                controller.setSearchQuery(value);
              },
              decoration: InputDecoration(
                hintText: 'Cari buku...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: controller.obx(
                    (state) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Mengatur jumlah kolom
                    mainAxisSpacing: 10.0, // Spasi vertikal antara item
                    crossAxisSpacing: 10.0, // Spasi horizontal antara item
                    childAspectRatio: 0.8, // Rasio lebar-ke-tinggi setiap item, membuat item berbentuk persegi
                  ),
                  itemCount: state!.length,
                  itemBuilder: (ctx, index) {
                    final book = state[index];
                    // Periksa apakah judul atau penulis buku mengandung teks pencarian
                    final bool isMatch = (book.judul?.toString()?.toLowerCase()?.contains(controller.searchQuery.toString() ?? '') ?? false) ||
                        (book.penulis?.toString()?.toLowerCase()?.contains(controller.searchQuery.toString() ?? '') ?? false);

                    // Tampilkan item hanya jika judul atau penulis cocok dengan teks pencarian
                    if (controller.searchQuery != null && controller.searchQuery!.isNotEmpty && !isMatch) {
                      return SizedBox.shrink(); // Item kosong jika tidak cocok
                    }

                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.ADD_PEMINJAMAN,
                          parameters: {'id': book.id?.toString() ?? '0', 'judul': book.judul ?? ""},
                        );
                      },
                      child: Card(
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: state[index].image ?? '',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${book.judul}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "${book.penulis}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                            ),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
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
          currentIndex: 1, // index dari item yang sedang terpilih
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
          selectedItemColor: Colors.cyanAccent, // Warna teks label yang terpilih
          unselectedItemColor: Colors.white, // Warna teks label yang tidak terpilih
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
      ),
    );
  }
}
