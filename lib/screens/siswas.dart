import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/screens/edit_siswa.dart';
import 'package:provider/provider.dart';
import 'package:informasi_akademik_firebase/models/siswa.dart';

class Siswas extends StatefulWidget {
  @override
  _SiswasState createState() => _SiswasState();
}

class _SiswasState extends State<Siswas> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final siswas = Provider.of<List<Siswa>>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditSiswa(),
            ),
          );
        },
        tooltip: 'Tambah Siswa',
        child: Icon(Icons.add),
      ),
      body: (siswas != null)
          ? ListView.builder(
              itemCount: siswas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    siswas[index].nim.toString(),
                  ),
                  trailing: Text(siswas[index].namaSiswa),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditSiswa(
                          siswas[index],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
