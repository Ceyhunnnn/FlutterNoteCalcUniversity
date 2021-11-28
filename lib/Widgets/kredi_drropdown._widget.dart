import "package:flutter/material.dart";
import 'package:uni_note/Constants/app_constant.dart';
import 'package:uni_note/helper/data_helper.dart';
class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;

  const KrediDropdownWidget({ required this.onKrediSecildi,Key? key }) : super(key: key);

  @override
  _KrediDropdownWidgetState createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
    double secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
  return Container(
      alignment: Alignment.center,
      padding: Sabitler.DropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
          value: secilenKrediDegeri,
          elevation: 16,
          iconEnabledColor: Sabitler.anaRenk.shade200,
          onChanged: (deger) {
            setState(() {
              secilenKrediDegeri = deger!;
widget.onKrediSecildi(deger);          });
          },
          underline: Container(),
          items: DataHelper.tumKrediler()),
    );
  }
}