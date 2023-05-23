import 'package:flutter/material.dart';
import 'package:sqflitee/screens/kahraman_listesi.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KahramanListesi(),
    );
  }

}

