import 'package:flutter/material.dart';
import 'package:flutter_crud/pegawai/homepage.dart';
import 'package:http/http.dart' as http;

class EditDataPage extends StatefulWidget {
  final Map ListData;
  const EditDataPage({Key? key, required this.ListData}) : super(key: key);

  @override
  State<EditDataPage> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController nip = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController tanggal_lahir = TextEditingController();
  TextEditingController nomor_telepon = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<bool> _update() async {
    final response = await http.post(
      Uri.parse('http://192.168.1.7/crudflutter/edit.php'),
      body: {
        "id": id.text,
        "nip": nip.text,
        "nama": nama.text,
        "tanggal lahir": tanggal_lahir.text,
        "nomor telepon": nomor_telepon.text,
        "email": email.text,
        "password": password.text,
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    id.text = widget.ListData['id'];
    nip.text = widget.ListData['nip'];
    nama.text = widget.ListData['nama'];
    tanggal_lahir.text = widget.ListData['tanggal_lahir'];
    nomor_telepon.text = widget.ListData['nomor_telepon'];
    email.text = widget.ListData['email'];
    password.text = widget.ListData['password'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data Pegawai"),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: nip,
                decoration: InputDecoration(
                  hintText: "nip",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "nip tidak boleh kosong";
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
                controller: email,
                decoration: InputDecoration(
                  hintText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password tidak boleh kosong";
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
                    _update().then((value) {
                      if (value) {
                        final snackBar = SnackBar(
                          content: const Text('Data Berhasil di Update'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        final snackBar = SnackBar(
                          content: const Text('Data Gagal di Update'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  }
                },
                child: Text("UPDATE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
