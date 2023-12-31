import 'package:flutter/material.dart';
import 'package:pf/core/utils/app_assets.dart';

import '../../../../core/utils/app_extensions.dart';
import '../../../../data/models/responsive_size.dart';
import 'circle_image_border.dart';

class IntroCircleImageBox extends StatelessWidget {
  const IntroCircleImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(
      deviceWidth: context.width,
      mobileSize: context.width * .78,
      ipadSize: context.width * .50,
      smallScreenSize: context.width * .37,
    );
    return SizedBox(
      height: responsiveSize.getSize(),
      child: CircleImageBorder(
        child: Image.asset(
          AppAssets.devImg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
