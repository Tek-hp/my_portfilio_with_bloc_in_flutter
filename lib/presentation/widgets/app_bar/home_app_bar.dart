import 'package:flutter/material.dart';
import 'package:pf/core/utils/app_colors.dart';
import 'package:pf/core/utils/app_constants.dart';
import 'package:pf/core/utils/app_enums.dart';
import 'package:pf/core/utils/app_extensions.dart';
import 'package:pf/presentation/widgets/app_bar/custom_menu_btn.dart';
import 'package:pf/presentation/widgets/app_bar/developer_name_btn.dart';
import 'package:pf/presentation/widgets/app_bar/horizontal_headers.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBarColor,
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DeveloperNameBtn(),
          context.width > DeviceType.ipad.getMaxWidth() ? const HorizontalHeaders() : const CustomMenuBtn()
        ],
      ),
    );
  }

  double _getHorizontalPadding(BuildContext context) {
    if (context.width < DeviceType.ipad.getMaxWidth()) {
      return context.width * .03;
    } else {
      return context.width * .08;
    }
  }
}
