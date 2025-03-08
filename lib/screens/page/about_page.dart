import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 70),
              child: Text('About App',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.qr_code_scanner,
                        size: 55, color: Colors.blue),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Text('QR Code Scanner App',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Selamat datang di Aplikasi Scan QR Code kami! Kami bangga mempersembahkan solusi yang sederhana dan efektif '
                'untuk memindai dan mengelola QR code dengan mudah. Aplikasi kami dirancang dengan tujuan untuk memberikan pengalaman '
                'yang nyaman dan berguna kepada pengguna kami. ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15)),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Text('Version 1.0.0', textAlign: TextAlign.center),
        elevation: 0,
      ),
    );
  }
}
