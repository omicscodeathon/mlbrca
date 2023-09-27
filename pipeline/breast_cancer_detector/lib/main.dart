import 'package:flutter/material.dart';
import './screens/body.dart';
void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'PNEUMOSARSCOV2',
        // home: AuthGate(),
        home: WeedRecognizer(),
        debugShowCheckedModeBanner: false,
  );
}
