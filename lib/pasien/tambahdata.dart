import 'package:flutter/material.dart';
import 'package:flutter_crud/pasien/homepage.dart';
import 'package:http/http.dart' as http;

class TambahDataPage extends StatefulWidget {
  const TambahDataPage({Key? key});

  @override
  State<TambahDataPage> createState() => _TambahDataPageState();
}

class _TambahDataPageState extends State<TambahDataPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nomor_rm = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController tanggal_lahir = TextEditingController();
  TextEditingController nomor_telepon = TextEditingController();
  TextEditingController alamat = TextEditingController();

  Future<bool> _simpan() async {
    final response = await http.post(
      Uri.parse('http://192.168.1.7/crudflutter/create1.php'),
      body: {
        "nomor_rm": nomor_rm.text,
        "nama": nama.text,
        "tanggal lahir": tanggal_lahir.text,
        "nomor telepon": nomor_telepon.text,
        "alamat": alamat.text,
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Pasien"),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: nomor_rm,
                decoration: InputDecoration(
                  hintText: "nomor_rm",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "nomor_rm tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                  hintText: "nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "nama tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: tanggal_lahir,
                decoration: InputDecoration(
                  hintText: "tanggal lahir",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "tanggal lahir tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: nomor_telepon,
                decoration: InputDecoration(
                  hintText: "nomor telepon",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "nomor telepon tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: alamat,
                decoration: InputDecoration(
                  hintText: "alamat",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "alamat tidak boleh kosong";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _simpan().then((value) {
                      if (value) {
                        final snackBar = SnackBar(
                          content: const Text('Data Berhasil di Simpan'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage1()),
                        );
                      } else {
                        final snackBar = SnackBar(
                          content: const Text('Data Gagal di Simpan'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  }
                },
                child: Text("SIMPAN"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
