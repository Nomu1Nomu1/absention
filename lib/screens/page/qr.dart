import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:absention/screens/page/about_page.dart';
import 'package:absention/screens/page/home_page.dart';
import 'package:absention/screens/page/profile_page.dart';

// import 'package:share_plus/share_plus.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  String? qrResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Icon(Icons.qr_code_scanner, size: 75, color: Colors.white),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Center(
                          child: Text('QR Code Scanner App',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)))),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('QR Scan'),
              leading: const Icon(Icons.qr_code),
            ),
            Divider(),
            ListTile(
              title: const Text('My Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) => ProfilePage()));
              },
            ),
            Divider(),
            ListTile(
              title: const Text('About App'),
              leading: const Icon(Icons.info),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) => AboutPage()));
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(qrResult ?? '',
                    style: const TextStyle(
                        fontSize: 16, backgroundColor: Colors.blue))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(130.0, 3.0, 130.0, 3.0),
            child: ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    qrResult = res;
                  }
                });
              },
              child: const Text('Open Scanner'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(130.0, 3.0, 130.0, 3.0),
            child: ElevatedButton(
                onPressed: () {
                  FlutterClipboard.copy('$qrResult')
                      .then((value) => print('copied'));
                  Fluttertoast.showToast(
                      msg: "Berhasil disalin",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const Text('Copy'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white)),
          ),

          // ElevatedButton(
          //     onPressed: () {
          //       Share.share('check out my website https://example.com');
          //     },
          //     child: Text('Share'))
        ],
      ),
    );
  }
}
