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
  Widget build(BuildContext context) {
    final siswas = Provider.of<List<Siswa>>(context);
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

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
                return Card(
                  color: Colors.blue[50],
                  elevation: 1.0,
                  child: ListTile(
                    title: Text(
                      siswas[index].namaSiswa,
                      style: textStyle,
                    ),
                    subtitle: Text(
                      siswas[index].nim.toString(),
                    ),
                    trailing: Text(
                      siswas[index].jenisKelamin,
                      style: textStyle,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditSiswa(
                            siswas[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
