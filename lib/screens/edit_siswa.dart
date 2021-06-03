import 'package:informasi_akademik_firebase/models/siswa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:informasi_akademik_firebase/providers/siswa_provider.dart';

class EditSiswa extends StatefulWidget {
  final Siswa siswa;

  EditSiswa([this.siswa]);

  @override
  _EditSiswaState createState() => _EditSiswaState();
}

class _EditSiswaState extends State<EditSiswa> {
  final nimController = TextEditingController();
  final namaController = TextEditingController();
  final jkController = TextEditingController();

  @override
  void dispose() {
    nimController.dispose();
    namaController.dispose();
    jkController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.siswa == null) {
      //New Record
      nimController.text = "";
      namaController.text = "";
      jkController.text = "";
      new Future.delayed(Duration.zero, () {
        final siswaProvider =
            Provider.of<SiswaProvider>(context, listen: false);
        siswaProvider.loadValues(Siswa());
      });
    } else {
      //Controller Update
      nimController.text = widget.siswa.nim.toString();
      namaController.text = widget.siswa.namaSiswa;
      jkController.text = widget.siswa.jenisKelamin;
      //State Update
      new Future.delayed(Duration.zero, () {
        final siswaProvider =
            Provider.of<SiswaProvider>(context, listen: false);
        siswaProvider.loadValues(widget.siswa);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final siswaProvider = Provider.of<SiswaProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Siswa')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              controller: nimController,
              decoration: InputDecoration(hintText: 'Nim'),
              onChanged: (value) => siswaProvider.changeNim(value),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: namaController,
              decoration: InputDecoration(hintText: 'Nama Siswa'),
              onChanged: (value) {
                siswaProvider.changeNamaSiswa(value);
              },
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: jkController,
              decoration: InputDecoration(hintText: 'Jenis Kelamin'),
              onChanged: (value) {
                siswaProvider.changeJenisKelamin(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                siswaProvider.saveSiswa();
                Navigator.of(context).pop();
              },
            ),
            (widget.siswa != null)
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    child: Text('Delete'),
                    onPressed: () {
                      siswaProvider.removeSiswa(widget.siswa.siswaId);
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
