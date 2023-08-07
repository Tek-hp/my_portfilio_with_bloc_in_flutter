import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pf/core/utils/app_colors.dart';
import 'package:pf/core/utils/app_enums.dart';
import 'package:pf/core/utils/app_extensions.dart';
import 'package:pf/core/utils/app_styles.dart';
import 'package:pf/data/models/custom_service.dart';

class BasicServiceItem extends StatefulWidget {
  const BasicServiceItem({super.key, required this.service});

  final CustomService service;

  @override
  State<BasicServiceItem> createState() => _BasicServiceItemState();
}

class _BasicServiceItemState extends State<BasicServiceItem> {
  Color itemColor = AppColors.lowPriority;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: itemColor,
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              widget.service.logo,
              height: 50,
            ),
            const SizedBox(height: 16),
            if (context.width > DeviceType.mobile.getMinWidth())
              FittedBox(
                child: Text(
                  widget.service.service,
                  style: AppStyles.s24,
                  // minFontSize: 8,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onExit(event) {
    setState(() => itemColor = AppColors.lowPriority);
  }

  void _onEnter(event) {
    setState(() => itemColor = AppColors.primaryColor);
  }
}