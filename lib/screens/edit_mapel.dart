import 'package:informasi_akademik_firebase/models/mapel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:informasi_akademik_firebase/providers/mapel_provider.dart';

class EditMapel extends StatefulWidget {
  final Mapel mapel;

  EditMapel([this.mapel]);

  @override
  _EditMapelState createState() => _EditMapelState();
}

class _EditMapelState extends State<EditMapel> {
  final kodeMapelController = TextEditingController();
  final mataPelajaranController = TextEditingController();
  final pengajarController = TextEditingController();

  @override
  void dispose() {
    kodeMapelController.dispose();
    mataPelajaranController.dispose();
    pengajarController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.mapel == null) {
      //New Record
      kodeMapelController.text = "";
      mataPelajaranController.text = "";
      pengajarController.text = "";
      new Future.delayed(Duration.zero, () {
        final mapelProvider =
            Provider.of<MapelProvider>(context, listen: false);
        mapelProvider.loadValues(Mapel());
      });
    } else {
      //Controller Update
      kodeMapelController.text = widget.mapel.kodeMapel;
      mataPelajaranController.text = widget.mapel.mataPelajaran;
      pengajarController.text = widget.mapel.pengajar;
      //State Update
      new Future.delayed(Duration.zero, () {
        final mapelProvider =
            Provider.of<MapelProvider>(context, listen: false);
        mapelProvider.loadValues(widget.mapel);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapelProvider = Provider.of<MapelProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Mapel')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: kodeMapelController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Kode Mapel'),
              onChanged: (value) {
                mapelProvider.changeKodeMapel(value);
              },
            ),
            TextField(
              controller: mataPelajaranController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Nama Mapel'),
              onChanged: (value) {
                mapelProvider.changeMataPelajaran(value);
              },
            ),
            TextField(
              controller: pengajarController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Pengajar'),
              onChanged: (value) => mapelProvider.changePengajar(value),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                mapelProvider.saveMapel();
                Navigator.of(context).pop();
              },
            ),
            (widget.mapel != null)
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Delete'),
                    onPressed: () {
                      mapelProvider.removeMapel(widget.mapel.mapelId);
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
