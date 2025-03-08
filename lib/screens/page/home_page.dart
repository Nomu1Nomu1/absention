import 'package:flutter/material.dart';
import 'package:absention/screens/page/profile_page.dart';
import 'package:absention/screens/page/qr.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF7AC374),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) => ProfilePage()));
                  },
                  child: Text('Profile Page'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7AC374),
                      foregroundColor: Colors.white)),
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) => QRPage()));
          }, child: Text('Scan QR Code'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7AC374),
            foregroundColor: Colors.white,
          ),)
        ],
      ),
      drawer: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        width: MediaQuery.of(context).size.width - 150,
        child: ListView(
          children: [
            Text("Gmail", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Divider(),
            buildRow(
              icon: Icon(Icons.all_inbox),
              text: 'All Inboxes',
            ),
            Divider(),
            buildRow(
              icon: Icon(Icons.inbox),
              text: 'Primary',
            ),
            buildRow(
              icon: Icon(Icons.people),
              text: 'Social',
            ),
            buildRow(
              icon: Icon(Icons.local_offer),
              text: 'Promotions',
            ),
            Text("All Labels"),
            buildRow(
              icon: Icon(Icons.star),
              text: 'Starred',
            ),
            buildRow(
              icon: Icon(Icons.access_time),
              text: 'Snoozed',
            ),
            buildRow(
              icon: Icon(Icons.label_important),
              text: 'Important',
            ),
            buildRow(
              icon: Icon(Icons.send),
              text: 'Sent',
            ),
            buildRow(
              icon: Icon(Icons.schedule),
              text: 'Scheduled',
            ),
            buildRow(
              icon: Icon(Icons.outbox),
              text: 'Outbox',
            ),
            buildRow(
              icon: Icon(Icons.insert_drive_file),
              text: 'Drafts',
            ),
            buildRow(
              icon: Icon(Icons.mail),
              text: 'All Mail',
            ),
            buildRow(
              icon: Icon(Icons.error),
              text: 'Spam',
            ),
            buildRow(
              icon: Icon(Icons.delete),
              text: 'Trash',
            ),
            Text("Google Apps"),
            buildRow(
              icon: Icon(Icons.calendar_today),
              text: 'Calendar',
            ),
            buildRow(
              icon: Icon(Icons.contacts),
              text: 'Contacts',
            ),
            Divider(),
            buildRow(
              icon: Icon(Icons.settings),
              text: 'Settings',
            ),
            buildRow(icon: Icon(Icons.help), text: 'Help & feedback')
          ],
        ),
      ),
    );
  }

  Row buildRow({required Icon icon, required String text}) {
    return Row(
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          child: Text(text),
        )
      ],
    );
  }
}
