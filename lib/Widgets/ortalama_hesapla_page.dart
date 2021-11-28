import "package:flutter/material.dart";
import 'package:uni_note/Constants/app_constant.dart';
import 'package:uni_note/Widgets/ders_listesi.dart';
import 'package:uni_note/Widgets/harf_dropdown_widget.dart';
import 'package:uni_note/Widgets/kredi_drropdown._widget.dart';
import 'package:uni_note/Widgets/ortalama_goster_widget.dart';
import 'package:uni_note/helper/data_helper.dart';
import 'package:uni_note/model/ders.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
 double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                    flex: 1,
                    child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenenDersler.length,
                      ortalama: DataHelper.ortalamaHesapla(),
                    )),
              ],
            ),
            Expanded(
              child: DersListesi(
                onElemanCikarildi: (index){
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {
                  });
                }
                ,
              ),

            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormFiedl(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: Sabitler.yatayPadding8,
                child: HarfDropdownWidget(
                  onHarfSecildi: (harf){
                    secilenHarfDegeri=harf;
                  },
                )
              ),),
              Expanded(
                  child: Padding(
                padding: Sabitler.yatayPadding8,
                child: KrediDropdownWidget(
                 onKrediSecildi:(kredi){
                    secilenKrediDegeri=kredi;
                 }
                
                  ))),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios,
                    color: Sabitler.anaRenk, size: 30),
              )
            ],
          ),
          SizedBox(
            height: 5,
          )
        ]));
  }

  Widget _buildTextFormFiedl() {
    return TextFormField(
      onSaved: (deger){
          setState(() {
            
            girilenDersAdi=deger!;

          });
      },
      validator: (s){
        if(s!.length<=0){
          return "Ders adını girin";
        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Ders giriniz",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2)),
    );
  }



  _dersEkleveOrtalamaHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
        var eklenecekDers=Ders(ad:girilenDersAdi,harfDegeri: secilenHarfDegeri,krediDegeri: secilenKrediDegeri);
        //print(eklenecekDers);
        DataHelper.dersEkle(eklenecekDers);
        print(DataHelper.tumEklenenDersler);
        setState(() {
        });
        
  }
}
}