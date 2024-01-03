import "package:flutter/material.dart";
import "package:flutter_crud/models/login.dart";
import "package:flutter_crud/pegawai/homepage.dart";
import "package:flutter_crud/pasien/homepage.dart";

class beranda extends StatefulWidget {
  const beranda({super.key});

  @override
  State<beranda> createState() => _berandaState();
}

class _berandaState extends State<beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'ADMIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Pegawai'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (HomePage())));
              },
            ),
            ListTile(
              title: Text('Pasien'),
              onTap: () {
                // Tambahkan fungsi yang dijalankan saat menu 2 diklik
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage1())); // Menutup sidebar
                // Tambahkan aksi lain sesuai kebutuhan
              },
            ),

            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Tambahkan fungsi yang dijalankan saat menu 2 diklik
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => loginPage())); // Menutup sidebar
                // Tambahkan aksi lain sesuai kebutuhan
              },
            ),
            // Tambahkan menu lain jika diperlukan
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Welcome',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
