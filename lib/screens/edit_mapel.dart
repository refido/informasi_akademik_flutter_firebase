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
  final kodeController = TextEditingController();
  final mapelController = TextEditingController();
  final guruController = TextEditingController();

  @override
  void dispose() {
    kodeController.dispose();
    mapelController.dispose();
    guruController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.mapel == null) {
      //New Record
      kodeController.text = "";
      mapelController.text = "";
      guruController.text = "";
      new Future.delayed(Duration.zero, () {
        final mapelProvider =
            Provider.of<MapelProvider>(context, listen: false);
        mapelProvider.loadValues(Mapel());
      });
    } else {
      //Controller Update
      kodeController.text = widget.mapel.kodeMapel;
      mapelController.text = widget.mapel.mataPelajaran;
      guruController.text = widget.mapel.pengajar;
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
              keyboardType: TextInputType.text,
              controller: kodeController,
              decoration: InputDecoration(hintText: 'Kode Mata Pelajaran'),
              onChanged: (value) => mapelProvider.changeKodeMapel(value),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: mapelController,
              decoration: InputDecoration(hintText: 'Mata Pelajaran'),
              onChanged: (value) {
                mapelProvider.changeMataPelajaran(value);
              },
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: guruController,
              decoration: InputDecoration(hintText: 'Pengajar'),
              onChanged: (value) {
                mapelProvider.changePengajar(value);
              },
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
