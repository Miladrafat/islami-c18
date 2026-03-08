import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';

class SebhaScreen extends StatefulWidget {
  static const String routeName="sebha";
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int zekrIndex = 0;
  double rotation = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا الله الا الله",
    "الله أكبر",
  ];

  void onTapSebha() {
    setState(() {
      counter++;
      rotation += 0.05;

      if (counter == 33) {
        counter = 0;
        zekrIndex = (zekrIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsManager.sebha_Background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Image.asset(AssetsManager.sebha_logo,fit: BoxFit.fill,),
                const SizedBox(height: 16),
                const Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset(AssetsManager.sebha_Header,height: 86,width: 145,fit: BoxFit.fill,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: onTapSebha,
                      child: AnimatedRotation(
                        turns: rotation,
                        duration: const Duration(milliseconds: 10),
                        child: Image.asset(AssetsManager.sebha_Body,
                          width: double.infinity,
                          height: screenHeight*.4,
                          //fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTapSebha,
                      child: Column(
                        children: [
                          Text(
                            azkar[zekrIndex],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            counter.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      );
  }
}