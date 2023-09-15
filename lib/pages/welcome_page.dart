import 'package:flutter/material.dart';
import 'package:tripsmountain/core/constant/color_palette.dart';
import 'package:tripsmountain/core/constant/dimension_constant.dart';
import 'package:tripsmountain/pages/main_page.dart';
import 'package:tripsmountain/widgets/app_text.dart';
import 'package:tripsmountain/widgets/button_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> images = ["1.jpg", "2.jpg", "3.jpg", "4.jpg"];
  List<String> namePlayers = ["Bruno(c) Fernandes ","Raphael Varane","Jadon Sancho","Marcus Rashford"];
  List<String> numberPlayers = ["8","19","25","10"];
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            body: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  final names = namePlayers[index].split(' ');
                  final firstName = names[0];
                  final lastName = names[1];
                  return Container(
                    // set full screen
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/"+images[index]
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 100,
                          left: kDefaultPadding,
                          right: kDefaultPadding
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText(
                                text: "Manchester United",
                                size: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              AppText(
                                text: firstName,
                                fontWeight: FontWeight.bold,
                                size: 36,
                                color: Colors.white,
                              ),
                              AppText(
                                text: lastName,
                                fontWeight: FontWeight.bold,
                                size: 32,
                                color: Colors.white,
                              ),
                              AppText(
                                text: numberPlayers[index],
                                fontWeight: FontWeight.bold ,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 300,
                                  child: AppText(text: "Câu lạc bộ bóng đá Manchester United "
                                      "là một câu lạc bộ bóng đá chuyên nghiệp có trụ sở tại Old Trafford.",
                                  size: 16, color: Colors.white.withOpacity(0.5),
                                  ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushNamed(MainPage.routeName);
                                },
                              child: ButtonNext(width: 100,)
                              ),
                            ],
                          ),
                          Column(
                            children: List.generate(4, (indexDots){
                              return Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                width: 8,
                                height: index == indexDots ? 25 : 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots ? ColorPalette.primaryColor : ColorPalette.primaryColor.withOpacity(0.5)
                                ),
                              );
                            }),
                      )
                        ],
                      ),
                    )
                  );
                }
            ),
          )
      ),
    );
  }
}
