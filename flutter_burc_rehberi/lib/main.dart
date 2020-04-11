import "package:flutter/material.dart";
import 'package:flutterburcrehberi/burc_detay.dart';
import 'package:flutterburcrehberi/burc_liste.dart';
import 'file:///C:/Users/HAKKICAN/AndroidStudioProjects/flutter_test_app/flutter_burc_rehberi/test/testlib.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BurcListesi bL = new BurcListesi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burc Rehberi",
      debugShowCheckedModeBanner: false,


      initialRoute: "burcListesi",

      routes: {
        "burcListesi": (context) => bL,
      },


      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");
        if(pathElemanlari[1] == "burcDetay"){
          return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(pathElemanlari[2]),bL));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BurcListesi(),
    );
  }
}

