import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/screens/edit_mapel.dart';
import 'package:provider/provider.dart';
import 'package:informasi_akademik_firebase/models/mapel.dart';

class Mapels extends StatefulWidget {
  @override
  _MapelsState createState() => _MapelsState();
}

class _MapelsState extends State<Mapels> {
  @override
  Widget build(BuildContext context) {
    final mapels = Provider.of<List<Mapel>>(context);
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditMapel(),
            ),
          );
        },
        tooltip: 'Tambah Mapel',
        child: Icon(Icons.add),
      ),
      body: (mapels != null)
          ? ListView.builder(
              itemCount: mapels.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue[50],
                  elevation: 1.0,
                  child: ListTile(
                    title: Text(
                      mapels[index].mataPelajaran,
                      style: textStyle,
                    ),
                    subtitle: Text(
                      mapels[index].kodeMapel,
                    ),
                    trailing: Text(
                      mapels[index].pengajar,
                      style: textStyle,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditMapel(
                            mapels[index],
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
