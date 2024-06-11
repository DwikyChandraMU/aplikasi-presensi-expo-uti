import 'package:flutter/material.dart';
import 'package:project_expo/screen/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _nama = ""; // Variabel untuk menyimpan nama
  late String _jabatan = ""; // Variabel untuk menyimpan jabatan

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk mengambil data dari database saat widget pertama kali dibuat
    fetchData();
  }

  // Fungsi untuk mengambil data dari database
  void fetchData() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2/aplikasi_absensi_api/biodata.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      // Ambil data nama dan jabatan dari hasil response
      _nama = data[0]['nama'];
      _jabatan = data[0]['jabatan'];
      setState(() {}); // Memperbarui tampilan setelah mendapatkan data
    } else {
      throw Exception('Failed to load biodata');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Header
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _nama,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _jabatan,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Data Pribadi"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Data Pribadi',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Nama     : $_nama",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text("Jabatan : $_jabatan",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Tutup'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app_outlined),
                  title: Text("Keluar"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => LoginPage()))
                        .then((value) => (value));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
