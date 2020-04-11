import 'package:flutter/material.dart';
import 'package:flutterburcrehberi/utils/strings.dart';
import 'models/burc.dart';

class BurcListesi extends StatefulWidget {
  static List<Burc> tumBurclar;
  bool kRenk1 = true;

  MainActivityState createState() => MainActivityState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: "Karşıt Renk", icon: Icons.done),
  CustomPopupMenu(title: "Uğurlu Renk", icon: Icons.star)
];

List<Burc> veriKaynaginiHazirla() {
  List<Burc> burclar = [];

  for (int i = 0; i < 12; i++) {
    String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
    String buyukResim =
        Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

    Burc eklenecekBurc = Burc(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i],
        Strings.BURC_GENEL_OZELLIKLERI[i], kucukResim, buyukResim);
    burclar.add(eklenecekBurc);
  }
  return burclar;
}

Widget listeyiHazirla() {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return tekSatirBurc(context, index);
    },
    itemCount: BurcListesi.tumBurclar.length,
  );
}

Widget tekSatirBurc(BuildContext context, int index) {
  Burc oanListeyeEklenenBurc = BurcListesi.tumBurclar[index];
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
        leading: Image.asset(
          "images/" + oanListeyeEklenenBurc.burcKucukResim,
          width: 64,
          height: 64,
        ),
        title: Text(
          oanListeyeEklenenBurc.burcAdi,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.red),
        ),
        subtitle: Text(
          oanListeyeEklenenBurc.burcTarihi,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black54),
        ),
        trailing: Icon(Icons.arrow_forward, color: Colors.black),
      ),
    ),
  );
}

class MainActivityState extends State<BurcListesi> {
  //bool kRenk = true;

  //bool get kRenk => kRenk;

  void _select(CustomPopupMenu choice) {
    setState(() {
      if (choice.title == "Karşıt Renk") {
        widget.kRenk1 = true;
        choices[0].icon = Icons.done;
        choices[1].icon = Icons.star;
      } else if (choice.title == "Uğurlu Renk") {
        widget.kRenk1 = false;
        choices[0].icon = Icons.close;
        choices[1].icon = Icons.done;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    BurcListesi.tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(title: Text("Burç Rehberi"), actions: <Widget>[
        PopupMenuButton<CustomPopupMenu>(
          elevation: 3.2,
          onSelected: _select,
          itemBuilder: (BuildContext context) {
            return choices.map((CustomPopupMenu choice) {
              return PopupMenuItem<CustomPopupMenu>(
                value: choice,
                child: ListTile(
                  title: Text(choice.title),
                  leading: Icon(choice.icon),
                ),
              );
            }).toList();
          },
        )
      ]),
      body: listeyiHazirla(),
    );
  }


}

class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon});

  String title;
  IconData icon;
}
