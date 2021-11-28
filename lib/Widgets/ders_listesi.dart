import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:uni_note/Constants/app_constant.dart';
import 'package:uni_note/helper/data_helper.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;

  const DersListesi({Key? key, required this.onElemanCikarildi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List tumDersler=DataHelper.tumEklenenDersler;
    return tumDersler.length>0?ListView.builder(itemCount: tumDersler.length,
      itemBuilder: (context,index){
      return Dismissible(
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
          onElemanCikarildi(index);

        },
        key:UniqueKey(),//listeye eklenen her bir elemana key atıyor
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(child: ListTile(
            title: Text(tumDersler[index].ad),
            leading:CircleAvatar(
              backgroundColor: Sabitler.anaRenk,
              child: Text(
                (tumDersler[index].harfDegeri * tumDersler[index].krediDegeri).toStringAsFixed(0),
              ),
            ),
            subtitle: Text("${tumDersler[index].krediDegeri} kredi , Not degeri ${tumDersler[index].harfDegeri}"),
          ),),
        ),
      );


    }
    ):Container(
      child:Center(child: Text("Lütfen Ders Ekleyin",style: Sabitler.baslikStyle,)) ,);
  }
}

