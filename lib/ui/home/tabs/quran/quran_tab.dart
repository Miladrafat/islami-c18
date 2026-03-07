import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c18/core/remote/local/prefs_manager.dart';
import 'package:islami_c18/core/resources/assets_manager.dart';
import 'package:islami_c18/core/resources/colors_manager.dart';
import 'package:islami_c18/core/resources/strings_manager.dart';
import 'package:islami_c18/ui/home/tabs/quran/widgets/most_recently_item.dart';
import 'package:islami_c18/ui/home/tabs/quran/widgets/sura_Item.dart';

import '../../../../model/sura_model.dart';
// untracked
// ignored
// tracked
// -------
// commit
class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = "";
  List<SuraModel> filteredSuras = SuraModel.surasList;
  List<SuraModel> mostRecentlySuras = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostRecentlySuras = PrefsManager.getMostRecently();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManager.quranBack),fit: BoxFit.fill)
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 20
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(AssetsManager.islamiHeader,width: screenWidth*0.75,)),
              SizedBox(height: 21,),
              TextField(
                onChanged: (value) {
                  onSearch(value);
                },
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.white
                ),
                decoration:InputDecoration(
                  hintText: StringsManager.suraName,
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.white
                  ),
                  filled: true,
                  fillColor: ColorsManager.black.withValues(
                    alpha: 0.7
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 11,
                      top: 14,
                      bottom: 13
                    ),
                    child: SvgPicture.asset(AssetsManager.home,
                    colorFilter: ColorFilter.mode(ColorsManager.gold, BlendMode.srcIn),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorsManager.gold,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorsManager.gold,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorsManager.gold,
                      )
                  )
                ) ,
              ),
              SizedBox(height: 20,),
              if(searchText.isEmpty)...[
                Text(StringsManager.mostRecently, style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: ColorsManager.white
                ),),
                SizedBox(height: 10,),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: mostRecentlySuras.isEmpty
                      ?Center(
                        child: Text("No saved suras found",style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: ColorsManager.white
                                          ),),
                      )
                      :ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => MostRecentlyItem(
                        sura: mostRecentlySuras[index],
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 10,),
                      itemCount: mostRecentlySuras.length
                  ),
                ),
                SizedBox(height: 10,),
                Text(StringsManager.surasList, style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: ColorsManager.white
                ),),
              ],
              SizedBox(height: 10,),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => SuraItem(
                      filteredSuras[index],
                      () {
                        mostRecentlySuras.remove(filteredSuras[index]);
                        mostRecentlySuras.insert(0,filteredSuras[index]);
                        PrefsManager.saveMostRecently(mostRecentlySuras);
                        setState(() {

                        });
                      },
                    ),
                    separatorBuilder: (context, index) => Divider(
                      height: 20,
                      indent: 40,
                      endIndent: 40,
                      color: ColorsManager.white,
                    ),
                    itemCount: filteredSuras.length
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onSearch(String value){
    searchText = value;
    if(searchText.isNotEmpty){
      filteredSuras = SuraModel.surasList.where((element) {
        if(element.suraNameEn.toLowerCase().contains(searchText.toLowerCase()) ||
            element.suraNameAr.contains(searchText)){
          return true;
        }
        return false;
      },).toList();
    }else{
      filteredSuras = SuraModel.surasList;
    }
    setState(() {

    });

  }
}
