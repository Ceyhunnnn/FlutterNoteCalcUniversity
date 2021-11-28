import "package:flutter/material.dart";
import 'package:uni_note/Constants/app_constant.dart';
import 'package:uni_note/helper/data_helper.dart';



class HarfDropdownWidget extends StatefulWidget {
    final Function onHarfSecildi;
  const HarfDropdownWidget({ required this.onHarfSecildi,Key? key }) : super(key: key);

  @override
  _HarfDropdownWidgetState createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
    double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
     return Container(
      alignment: Alignment.center,
      padding: Sabitler.DropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
          value: secilenHarfDegeri,
          elevation: 16,
          iconEnabledColor: Sabitler.anaRenk.shade200,
          onChanged: (deger) {
            setState(() {
              secilenHarfDegeri = deger!;
              widget.onHarfSecildi(secilenHarfDegeri);
            });
          },
          underline: Container(),
          items: DataHelper.tumDersHarfleri()),
    );
  }
}