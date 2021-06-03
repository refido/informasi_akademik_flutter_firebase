import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/screens/edit_siswa.dart';
import 'package:provider/provider.dart';
import 'package:informasi_akademik_firebase/models/siswa.dart';

class Siswas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final siswas = Provider.of<List<Siswa>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Siswas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditSiswa(),
                ),
              );
            },
          )
        ],
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
