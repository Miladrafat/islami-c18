import 'package:flutter/material.dart';
import 'package:islami_c18/core/remote/local/prefs_manager.dart';
import 'package:islami_c18/ui/hadeth_details/screen/hadeth_details_screen.dart';
import 'package:islami_c18/ui/home/screen/home_screen.dart';
import 'package:islami_c18/ui/sura_details/screen/sura_details_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(_)=>HadethDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

