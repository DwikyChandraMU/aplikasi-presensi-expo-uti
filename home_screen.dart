import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Biodata>> biodata;

  @override
  void initState() {
    super.initState();
    biodata = fetchBiodata();
  }

  Future<List<Biodata>> fetchBiodata() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2/aplikasi_absensi_api/biodata.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Biodata.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load biodata');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              FutureBuilder<List<Biodata>>(
                future: biodata,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!.map((biodata) {
                        return BiodataWidget(biodata: biodata);
                      }).toList(),
                    );
                  } else {
                    return Text('No data');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text("Jadwal Shift",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Card(
                child: ListTile(
                  leading: Text("Shift 1",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  title: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "00.00",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Masuk",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "06.00",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Pulang",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Text("Shift 2",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  title: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "06.00",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Masuk",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "12.00",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Pulang",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Text("Shift 3",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  title: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "12.00",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Masuk",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "18.00",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Pulang",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Text("Shift 4",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  title: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "18.00",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Masuk",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "00.00",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Pulang",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
// Add shift content as in the original code

class BiodataWidget extends StatelessWidget {
  final Biodata biodata;

  BiodataWidget({required this.biodata});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              children: [
                IconButton("QR Code", Icons.qr_code_outlined, 0),
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biodata Pekerja',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Nama       : ${biodata.nama}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Umur        : ${biodata.umur} Tahun",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Jabatan   : ${biodata.jabatan}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Biodata {
  final String nama;
  final String umur; // Mengubah tipe data menjadi String
  final String jabatan; // Mengubah tipe data menjadi String

  Biodata({required this.nama, required this.umur, required this.jabatan});

  factory Biodata.fromJson(Map<String, dynamic> json) {
    return Biodata(
      nama: json['nama'],
      umur: json['umur'], // Mengambil nilai dengan tipe data String
      jabatan: json['jabatan'], // Mengambil nilai dengan tipe data String
    );
  }
}

class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;

  IconButton(this.nameLabel, this.iconLabel, this.index);

  List<Map> _fragment = [
    {'title': 'Data Mahasiswa', 'view': Scaffold()}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _fragment[index]['view'],
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 13, 93, 58),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
