import 'package:islami_c18/model/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager{
  static late final SharedPreferences prefs;

  static Future<void> init()async{
    prefs =  await SharedPreferences.getInstance();
  }

  static saveMostRecently(List<SuraModel> mostRecent){
    List<String> suraNames = mostRecent.map((recentSura) => recentSura.suraNameEn,).toList();
    prefs.setStringList("mostRecent", suraNames);
  }

  static List<SuraModel> getMostRecently(){
    List<String> suraNames = prefs.getStringList("mostRecent")??[];
    List<SuraModel> surasList = [];
    for(int i=0;i<suraNames.length;i++){
      for(int j=0;j<SuraModel.surasList.length;j++){
        if(SuraModel.surasList[j].suraNameEn == suraNames[i]){
          surasList.add(SuraModel.surasList[j]);
          break;
        }
      }
    }
    return surasList;
  }
}