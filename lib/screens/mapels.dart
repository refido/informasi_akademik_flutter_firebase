import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/screens/edit_mapel.dart';
import 'package:provider/provider.dart';
import 'package:informasi_akademik_firebase/models/mapel.dart';

class Mapels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapels = Provider.of<List<Mapel>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapels'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditMapel(),
                ),
              );
            },
          )
        ],
      ),
      body: (mapels != null)
          ? ListView.builder(
              itemCount: mapels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    mapels[index].kodeMapel,
                  ),
                  trailing: Text(mapels[index].mataPelajaran),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditMapel(
                          mapels[index],
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
