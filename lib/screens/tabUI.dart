import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/screens/dashboard.dart';
import 'package:informasi_akademik_firebase/screens/siswas.dart';
import 'package:informasi_akademik_firebase/screens/mapels.dart';

class TabUI extends StatefulWidget {
  @override
  _TabUIState createState() => _TabUIState();
}

class _TabUIState extends State<TabUI> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                Tab(
                  text: "Profile",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Siswas(),
              Mapels(),
              Dashboard(),
            ],
          )),
    );
  }
}
