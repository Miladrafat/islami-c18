import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c18/core/resources/assets_manager.dart';
import 'package:islami_c18/core/resources/colors_manager.dart';
import 'package:islami_c18/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(suraText.isEmpty){
      readFile(suraModel.suraNumber);
    } // non blocking
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorsManager.gold
        ),
        title: Text(suraModel.suraNameEn,style: TextStyle(
          color: ColorsManager.gold,
          fontWeight: FontWeight.w700,
          fontSize: 20
        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      Text(suraModel.suraNameAr,style: TextStyle(
                          color: ColorsManager.gold,
                          fontWeight: FontWeight.w700,
                          fontSize: 24
                      ),),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Expanded(
                    child: suraText.isEmpty
                        ?Center(child: CircularProgressIndicator(
                      color: ColorsManager.gold,
                    ))
                        :SingleChildScrollView(
                      child: Text(suraText,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            height: 2.5,
                            color: ColorsManager.gold,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.mosque)
        ],
      ),
    );
  }

  int add(int num1 , int num2){
    return num1+num2;
  }

  String suraText = "";

  readFile(int suraNumber)async{
     add(9, 8); // blocking code
     String suraTextFile = await rootBundle.loadString("assets/Suras/$suraNumber.txt"); // non blocking code
    List<String> suraLines = suraTextFile.split("\n");
    for(int i=0;i<suraLines.length;i++){
      suraText+=suraLines[i];
      suraText+="(${i+1})";
    }
    setState(() {

    });

  }
}
