import 'package:flutter/material.dart';


import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';


import '../../../routes/app_pages.dart';
import '../controllers/detailbook_controller.dart';
class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF4942CE),
        leading: IconButton(
          onPressed: () {Routes.BOOK;
          Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
        ),
      ),
      backgroundColor: HexColor('#4942CE'),
      body: controller.obx((state) {
        return CustomScrollView(
          // physics: NeverScrollableScrollPhysics(),
          slivers: [
            for (int index = 0; index < state!.length; index++)
              SliverPadding(
                padding: const EdgeInsets.only(top: kToolbarHeight),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),

                        child: Container(
                          decoration: BoxDecoration(
                            // Your decoration here
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl: state[index].image ?? '',
                                width: 200,
                                height: 300,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.white, // Warna garis
                                      width: 1.0, // Lebar garis
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.only(bottom: 12.0),
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text(
                                      "${state[index].judul}",
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Penulis: ${state[index].penulis}",
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.raleway(fontSize: 14, color: Colors.white),
                                    ),
                                    SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        "Tanggal terbit: ${state[index].tanggalPublikasi}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 11, color: Colors.white),
                                      ),
                                    ),
                                    Center(

                                    ).paddingOnly(left: 16, right: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          Routes.ADD_PEMINJAMAN,
                                          parameters: {'id': (state[index].id ?? 0).toString(), 'judul': state[index].judul ?? ""},
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(140, 40),
                                        primary: Colors.white,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),

                                      child: Text(
                                        "Pinjam",
                                        style: GoogleFonts.raleway(fontSize: 14, color: Color(
                                            0xFF4942CE),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Text(
                                  "${state[index].sinopsis}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(fontSize: 14, color: Colors.white),
                                ),
                              ),
                              // Menggunakan ListView untuk menampilkan ulasan
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: state[index].ulasan?.length ?? 0,
                                itemBuilder: (ctx, ulasanIndex) {
                                  var ulasan = state[index].ulasan![ulasanIndex];
                                  var userName = ulasan.user != null ? ulasan.user!.name ?? '' : '';
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color:  Color(
                                            0xFFFCFCFC), width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "$userName",
                                              style: TextStyle(fontSize: 14, color: Color(0xFFFCFCFC)),
                                            ),
                                            SizedBox(height: 4),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    ulasan.ulasan ?? '',
                                                    style: TextStyle(fontSize: 15, color: Color(0xFFFCFCFC)),
                                                  ),
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "Rating: ${ulasan.rating}",
                                                  style: TextStyle(fontSize: 15, color: Color(0xFFFCFCFC)),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                      ),


                                    ),
                                  );
                                },
                              )

                              // Ulasan
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: state.length,
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }

}