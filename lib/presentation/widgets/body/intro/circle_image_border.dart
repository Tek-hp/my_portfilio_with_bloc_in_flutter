import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../data/models/responsive_size.dart';

class CircleImageBorder extends StatelessWidget {
  const CircleImageBorder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(
      deviceWidth: context.width,
      mobileSize: context.width * .62,
      ipadSize: context.width * .4,
      smallScreenSize: context.width * .29,
    );
    return Container(
      clipBehavior: Clip.antiAlias,
      width: responsiveSize.getSize(),
      height: responsiveSize.getSize(),
      padding: const EdgeInsets.all(0.1),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.7),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15),
          topLeft: Radius.circular(100),
          bottomLeft: Radius.circular(100),
        ),
      ),
      child: child,
    );
  }
}
