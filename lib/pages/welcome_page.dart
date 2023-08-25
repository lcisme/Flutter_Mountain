import 'package:flutter/material.dart';
import 'package:tripsmountain/core/color_palette.dart';
import 'package:tripsmountain/widgets/app_text.dart';
import 'package:tripsmountain/widgets/button_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> images = ["1.jpg","2.jpg","3.jpg","4.jpg"];
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
                  return Container(
                    // set full screen
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/"+images[index]
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 100,
                          left: 5,
                          right: 5
                          // left: kDefaultPadding,
                          // right: kDefaultPadding
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: "Trips",
                                size: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              AppText(text: "Mountain", size: 30, color: Colors.white,),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 300,
                                  child: AppText(text: "Mountains are majestic formations, "
                                      "rising high with snow-capped peaks, rugged cliffs, "
                                      "embodying the harmony between nature and human fascination.",
                                  size: 16, color: Colors.white.withOpacity(0.5),
                                  ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              ButtonNext(width: 100,)
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
