import 'package:flutter/material.dart';
import 'package:islami_c18/ui/home/screen/home_screen.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';




class OnBoardingScreen  extends StatefulWidget {
  static const String routeName="OnBoardingScreen ";
  static bool onBoardingCheck=false;

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onboardingData = [
    {
      "islamiHeader": AssetsManager.islamiHeader,
      "image":AssetsManager.imageInCenter_1,
      "title": "Welcome To Islmi App",
      "desc":""
    },
    {
      "islamiHeader": AssetsManager.islamiHeader,
      "image":AssetsManager.imageInCenter_2,
      "title": "Welcome To Islami",
      "desc": "We Are Very Excited To Have You In Our Community"
    },
    {
      "islamiHeader": AssetsManager.islamiHeader,
      "image":AssetsManager.imageInCenter_3,
      "title": "Reading the Quran",
      "desc": "Read,and your Lord is the Most Generous"
    },
    {
      "islamiHeader": AssetsManager.islamiHeader,
      "image":AssetsManager.imageInCenter_4,
      "title": "Bearish",
      "desc": "Praise the name of your Lord, the Most High"
    },
    {
      "islamiHeader": AssetsManager.islamiHeader,
      "image":AssetsManager.imageInCenter_5,
      "title": "Holy Quran Radio",
      "desc": "You can listen to the Holy Quran Radio through the application for free and easily"
    },
  ];

  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsManager.onboarding,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(onboardingData[index]["islamiHeader"]!,fit: BoxFit.fill,height: screenHeight*0.2,width:screenWidth*0.8,),
                        SizedBox(height: screenHeight*0.02,),
                        Image.asset(onboardingData[index]["image"]!,fit: BoxFit.fill,height: screenHeight*.45,width: screenWidth*.9,),
                        SizedBox(height: screenHeight*0.05,),
                        Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style:  const TextStyle(
                              color: Color(0xffE2BE7F),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),

                        ),
                        const SizedBox(height: 35),
                        Text(
                          onboardingData[index]["desc"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xffE2BE7F),
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    },
                    child: Text(
                      currentIndex ==0
                          ? ""
                          : "Back"
                      ,
                      style: TextStyle(color: Color(0xffE2BE7F),
                          fontWeight: FontWeight.w700,fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    List.generate(
                      onboardingData.length, (index) => Container(
                      margin: const EdgeInsets.all(4),
                      width: currentIndex == index ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Color(0xffE2BE7F)
                            : Color(0xff707070),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (currentIndex == onboardingData.length - 1) {
                        OnBoardingScreen.onBoardingCheck=true;
                        Navigator.pushNamed(context,HomeScreen.routeName);

                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == onboardingData.length - 1
                          ? "Finish"
                          : "Next"
                      ,
                      style: TextStyle(color: Color(0xffE2BE7F), fontWeight: FontWeight.w700,fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
