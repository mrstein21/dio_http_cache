import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_trial/mixins/style/color.dart';
import 'package:movie_trial/mixins/style/text.dart';

import '../../../mixins/constant/constant.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: kColorBlack,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(children: [
          InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: kColorWhite,
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            name,style: kTextAveHev16,
            maxLines: 1,
          )
        ]),
      ),
    );
  }
}
