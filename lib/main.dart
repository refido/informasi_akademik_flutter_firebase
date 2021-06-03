import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:informasi_akademik_firebase/providers/mapel_provider.dart';
import 'package:informasi_akademik_firebase/providers/siswa_provider.dart';
import 'package:provider/provider.dart';
import 'services/firestore_service.dart';
import 'screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SiswaProvider()),
        StreamProvider(
          create: (context) => firestoreService.getSiswas(),
          // initialData: initialData,
        ),
        ChangeNotifierProvider(create: (context) => MapelProvider()),
        StreamProvider(
          create: (context) => firestoreService.getMapels(),
          //  initialData: initialData,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
