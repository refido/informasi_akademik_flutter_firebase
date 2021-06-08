import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:informasi_akademik_firebase/services/sign_in.dart';
import 'tabUI.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final head = Padding(
      padding: EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: email, style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
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
    final buttonLogout = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: ElevatedButton(
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            primary: Colors.red,
          ),
          onPressed: () {
            signOutGoogle();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return LoginPage();
            }), ModalRoute.withName('/'));
          },
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[head, description, buttonToNext, buttonLogout],
          ),
        ),
      ),
    );
  }
}
