import 'package:flutter/material.dart';
import 'package:flutter_crud/models/Beranda.dart';
import 'package:flutter_crud/pegawai/editdata.dart';
import 'package:flutter_crud/pegawai/tambahdata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _listdata = [];
  bool _isloading = true;

  Future<void> _getdata() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.1.7/crudflutter/read.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
          _isloading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _hapus(String id) async {
    try {
      final response = await http
          .post(Uri.parse('http://192.168.1.7/crudflutter/hapus.php'), body: {
        "nip": id,
      });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DATA PEGAWAI"),
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _listdata.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => EditDataPage(
                                ListData: {
                                  "id": _listdata[index]['id'],
                                  "nip": _listdata[index]['nip'],
                                  "nama": _listdata[index]['nama'],
                                  "tanggal_lahir": _listdata[index]
                                      ['tanggal_lahir'],
                                  "nomor_telepon": _listdata[index]
                                      ['nomor_telepon'],
                                  "email": _listdata[index]['email'],
                                  "password": _listdata[index]['password'],
                                },
                              )),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(_listdata[index]['nama']),
                      subtitle: Text(_listdata[index]['nip']),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: ((context) {
                                  return AlertDialog(
                                    content: Text("Yakin Ingin Menghapus data"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Batal")),
                                      ElevatedButton(
                                          onPressed: () {
                                            _hapus(
                                              _listdata[index]['nip'],
                                            ).then((value) {
                                              if (value) {
                                                final snackBar = SnackBar(
                                                  content: const Text(
                                                      'Data Berhasil di Hapus'),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage()),
                                                );
                                              } else {
                                                final snackBar = SnackBar(
                                                  content: const Text(
                                                      'Data Gagal di Hapus'),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              }
                                            });

                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        beranda())),
                                                (route) => false);
                                          },
                                          child: Text("Yakin"))
                                    ],
                                  );
                                }));
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: Text(
            "+",
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => TambahDataPage()),
              ),
            );
          }),
    );
  }
}
