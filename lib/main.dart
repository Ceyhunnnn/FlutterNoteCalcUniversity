import 'package:flutter/material.dart';
import 'package:uni_note/Constants/app_constant.dart';
import 'package:uni_note/Widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Dinamik Ortalama Hesapla",
      theme: ThemeData(
        primarySwatch:Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //diger ortamlarda uygunluk saglar.

        ),
        home: OrtalamaHesaplaPage(),
    );
  }
}