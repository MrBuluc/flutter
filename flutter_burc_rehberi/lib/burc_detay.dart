import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterburcrehberi/burc_liste.dart';
import 'package:palette_generator/palette_generator.dart';

import 'models/burc.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;
  BurcListesi bL1;

  BurcDetay(this.gelenIndex, this.bL1);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  Color karsitRenk, ugurluRenk, detayRenk = Colors.white;
  PaletteGenerator paletteGenerator;
  BurcDetay bD;
  bool mod2;

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
    karsitRengiBul(secilenBurc);
    ugurluRengiBul(secilenBurc);
    mod2 = widget.bL1.kRenk1;
    if(mod2) detayRenk = Colors.white;
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + secilenBurc.burcBuyukResim));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }

  void karsitRengiBul(Burc b1) {
    if (b1.burcAdi == "Koc") {
      karsitRenk = Color(0xff0f3a1b);
    } else if (b1.burcAdi == "Boga") {
      karsitRenk = Color(0xff0b4d0a);
    } else if (b1.burcAdi == "Ikizler") {
      karsitRenk = Color(0xff8e0c35);
    } else if (b1.burcAdi == "Yengec") {
      karsitRenk = Color(0xff682d02);
    } else if (b1.burcAdi == "Aslan") {
      karsitRenk = Color(0xff400a00);
    } else if (b1.burcAdi == "Basak") {
      karsitRenk = Color(0xff2f2303);
    } else if (b1.burcAdi == "Terazi") {
      karsitRenk = Color(0xffd168d9);
    } else if (b1.burcAdi == "Akrep") {
      karsitRenk = Color(0xff35251f);
    } else if (b1.burcAdi == "Yay") {
      karsitRenk = Color(0xff00183a);
    } else if (b1.burcAdi == "Oglak") {
      karsitRenk = Color(0xff01212b);
    } else if (b1.burcAdi == "Kova") {
      karsitRenk = Color(0xffb03200);
    } else if (b1.burcAdi == "Balik") {
      karsitRenk = Color(0xff2b0702);
    }
  }

  void ugurluRengiBul(Burc b1) {
    if (b1.burcAdi == "Koc") {
      ugurluRenk = Color(0xffff4d00);
    } else if (b1.burcAdi == "Boga") {
      ugurluRenk = Color(0xff3065ac);
      detayRenk = Color(0xffe3b1d2);
    } else if (b1.burcAdi == "Ikizler") {
      ugurluRenk = Colors.yellow;
      detayRenk = Colors.black;
    } else if (b1.burcAdi == "Yengec") {
      ugurluRenk = Colors.white;
      detayRenk = Colors.black;
    } else if (b1.burcAdi == "Aslan") {
      ugurluRenk = Colors.yellow;
      detayRenk = Colors.black;
    } else if (b1.burcAdi == "Basak") {
      ugurluRenk = Color(0xff0047ab);
    } else if (b1.burcAdi == "Terazi") {
      ugurluRenk = Color(0xff30d5c8);
      detayRenk = Color(0xff121215);
    } else if (b1.burcAdi == "Akrep") {
      ugurluRenk = Colors.red;
      detayRenk = Colors.black;
    } else if (b1.burcAdi == "Yay") {
      ugurluRenk = Colors.purple;
      detayRenk = Color(0xff000055);
    } else if (b1.burcAdi == "Oglak") {
      ugurluRenk = Color(0xff654321);
      detayRenk = Colors.grey;
    } else if (b1.burcAdi == "Kova") {
      ugurluRenk = Color(0xff120a8f);
    } else if (b1.burcAdi == "Balik") {
      ugurluRenk = Color(0xff30d5c8);
      detayRenk = Color(0xff004800);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(primary: false, slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          primary: true,
          backgroundColor: baskinRenk != null ? baskinRenk : Colors.red,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "images/" + secilenBurc.burcBuyukResim,
              fit: BoxFit.cover,
            ),
            centerTitle: true,
            title: Text(
              secilenBurc.burcAdi + " Burcu ve Özellikleri",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            //margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: mod2 ? karsitRenk : ugurluRenk,
                borderRadius: BorderRadius.all(Radius.circular(0))),
            child: SingleChildScrollView(
              child: Text(
                secilenBurc.burcDetayi,
                style: TextStyle(fontSize: 18, color: detayRenk),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
