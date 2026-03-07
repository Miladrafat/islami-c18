import 'package:flutter/material.dart';
import 'package:islami_c18/core/resources/assets_manager.dart';
import 'package:islami_c18/core/resources/colors_manager.dart';
import 'package:islami_c18/model/sura_model.dart';

class MostRecentlyItem extends StatelessWidget {
  final SuraModel sura;
  const MostRecentlyItem({super.key,required this.sura});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
        Text(sura.suraNameEn,style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: ColorsManager.black
        ),),
        Text(sura.suraNameAr,style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: ColorsManager.black
        ),),
        Text("${sura.versesNumber} Verses",style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorsManager.black
        ),),
      ]),
        Image.asset(AssetsManager.mostRecent)
      ]),
    );
  }
}
