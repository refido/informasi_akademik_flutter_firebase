import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:informasi_akademik_firebase/services/sign_in.dart';
import 'tabUI.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final avatar = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'Siswa',
          child: SizedBox(
            height: 160,
            child: Image.network(imageUrl),
            // child: Image.asset('assets/merlin.jpg'),
          )),
    );

    final description = Padding(
      padding: EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: name, style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
    final buttonToNext = TextButton(
        child: Text(
          'Informasi Akademik',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => TabUI()));
        });
    final buttonLogout = TextButton(
        child: Text(
          'Logout',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        onPressed: () {
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => LoginPage()));
          signOutGoogle();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return LoginPage();
          }), ModalRoute.withName('/'));
        });

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[avatar, description, buttonToNext, buttonLogout],
        ),
      ),
    ));
  }
}
