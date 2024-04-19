import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:peminjam_perpustakaan_app/app/modules/book/controllers/book_controller.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(

      init: BookController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                      'Beranda',
                      style: TextStyle(
                        fontSize: 32, // Mengubah ukuran teks menjadi lebih besar
                        fontWeight: FontWeight.bold,
                        color: Colors.white,

                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade700,
                            border: Border.all(color: Colors.blue.shade300),
                          ),
                        ),
                        Positioned(
                          height: 180,
                          right: 10,
                          bottom: -10,
                          child: Lottie.asset('lottie/buku.json'),
                        ),
                        Positioned.fill(
                          top: 35,
                          left: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Mulai baca sekarang",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Silahkan pilih buku dengan menekan tombol 'Mulai' di bawah",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.indigo,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.BOOK);
                                  },
                                  child: const Text("Mulai"),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 10),
                  Text(
                    "Daftar Buku",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: controller.obx(
                          (state) => GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: state!.length,
                        itemBuilder: (ctx, index) {
                          return Card(
                            elevation: 4,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.ADD_PEMINJAMAN,
                                    parameters: {'id': (state[index].id ?? 0).toString(), 'judul': state[index].judul ?? ""});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${state[index].judul} (${state[index].tanggal_publikasi})",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${state[index].penulis} (${state[index].penerbit}) (${state[index].image})",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
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
              currentIndex: 0, // index dari item yang sedang terpilih
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
      },
    );
  }
}
