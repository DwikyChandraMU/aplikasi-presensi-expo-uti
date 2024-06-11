import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_expo/config/asset.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Asset.colorPrimary,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          Container(
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
                        Text('Biodata Pekerja',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Nama       : Dwiky Chandra M.U",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Umur        : 21 Tahun",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Jabatan   : HRD",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            // margin: EdgeInsets.only(bottom: 5),
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
                  // margin: EdgeInsets.all(5),
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
