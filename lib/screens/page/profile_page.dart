import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Profile Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset('images/isaiahtino0.jpg').image))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  height: 180,
                  child: ListView(
                    children: [
                      buildBio(
                          awalan: 'Nama        ',
                          data: 'Isaiah Tino Surya Saputra'),
                      buildBio(awalan: 'Nomor HP', data: '085158853505'),
                      buildBio(
                          awalan: 'Email         ',
                          data: 'Isaiah.Tino@gmail.com'),
                      buildBio(
                          awalan: 'Alamat      ',
                          data: 'Klaruan, Palur RT 03 RW 15'),
                      buildBio(
                          awalan: 'Cita-cita    ',
                          data: 'Game Developer/Data Scientist'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  height: 390,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 15.0),
                          child: Text('Riwayat Pendidikan',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        buildTingkatSekolah(
                          tingkat: 'Sekolah Dasar'
                        ),
                        buildRiwayat(
                          sekolah: 'SD N Palur 03',
                          tahun: 'Tahun 2012 - 2019'
                        ),
                        Divider(),
                        buildTingkatSekolah(
                          tingkat: 'Sekolah Menengah Pertama'
                        ),
                        buildRiwayat(
                          sekolah: 'SMP N Mojolaban 2',
                          tahun: 'Tahun 2019 - 2022'
                        ),
                        Divider(),
                        buildTingkatSekolah(
                          tingkat: 'Sekolah Menengah Kejuruan'
                        ),
                        buildRiwayat(
                          sekolah: 'SMK N 2 Surakarta',
                          tahun: 'Tahun 2022 - sekarang'
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildRiwayat({required String sekolah, required String tahun}) {
    return ListTile(
      title: Text(sekolah, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(tahun),
    );
  }

  Padding buildTingkatSekolah({required String tingkat}) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Text(tingkat, style: TextStyle(fontSize: 18)),
    );
  }

  Padding buildBio({required String awalan, required String data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(awalan, style: TextStyle(fontSize: 15)),
          Text('        : ', style: TextStyle(fontSize: 15)),
          Text(data, style: TextStyle(fontSize: 15))
        ],
      ),
    );
  }
}
