
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripsmountain/core/constant/dimension_constant.dart';
import 'package:tripsmountain/core/helper/ImageHelper.dart';
import 'package:tripsmountain/widgets/app_text.dart';
import 'package:tripsmountain/widgets/item_button_widget.dart';

import '../pages/detail_page.dart';

class ItemTrip extends StatelessWidget{
  const ItemTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.maxFinite,
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
        color: Colors.grey.withOpacity(0.05),
      ),
      margin: const EdgeInsets.only(bottom: kDefaultPadding*1.5),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 190,
            child: ImageHelper.LoadFromAsset('assets/images/welcome.jpg',
                fit: BoxFit.cover,radius: BorderRadius.only(topLeft: Radius.circular(kDefaultPadding), topRight: Radius.circular(kDefaultPadding))),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: "Tam Dao", fontWeight: FontWeight.bold, size: 25,),
                const SizedBox(width: kDefaultPadding,),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.locationDot, color: Colors.orange, size: 16),
                    const SizedBox(width: kMinPadding,),
                    AppText(text: "Vinh Phuc,Ha Noi", color: Colors.black.withOpacity(0.6),),
                  ],
                ),
                const SizedBox(height: kMinPadding,),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.star, color: Colors.orange, size: 16,),
                    const SizedBox(width: kMinPadding,),
                    AppText(text: "4"),
                    const SizedBox(width: kMinPadding,),
                    AppText(text: "(78 reviews)", color: Colors.grey,),
                  ],
                ),
                Row(
                  children: [
                    AppText(text: "\$120", fontWeight: FontWeight.bold, size: 25,),
                  Spacer(),
                    ItemButtonWidget(
                      data: "See Detail",
                      width: 100,
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailPage())
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}