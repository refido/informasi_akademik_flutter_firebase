import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/screens/siswas.dart';
import 'package:informasi_akademik_firebase/screens/mapels.dart';
import 'package:informasi_akademik_firebase/screens/products.dart';

class TabUI extends StatefulWidget {
  @override
  _TabUIState createState() => _TabUIState();
}

class _TabUIState extends State<TabUI> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Informasi Akademik"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Siswa",
                ),
                Tab(
                  text: "Mapel",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Siswas(),
              // Products(),
              Mapels(),
            ],
          )),
    );
  }
}
