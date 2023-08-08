import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pf/core/utils/app_extensions.dart';
import 'package:pf/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:pf/presentation/widgets/app_bar/vertical_headers_builder.dart';

import 'about_me/about_me_section.dart';
import 'contact/contact_section.dart';
import 'intro/intro_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _controller = ScrollController();
  final introKey = GlobalKey();
  final aboutKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initListenerForInteractWithHeaderIndex();
    });
  }

  void _initListenerForInteractWithHeaderIndex() {
    double introHeight = introKey.currentContext!.size!.height;
    double aboutHeight = aboutKey.currentContext!.size!.height;
    _controller.addListener(() {
      double controllerHeight = _controller.offset;
      if (_controller.position.extentAfter == 0.0) {
        context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(2));
      } else if (controllerHeight < introHeight) {
        context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(0));
      } else if (controllerHeight < (introHeight + aboutHeight)) {
        context.read<HomeBloc>().add(ChangeAppBarHeadersColorByColor(1));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AppBarHeadersIndexChanged) {
          Navigator.of(context).maybePop();
          const duration = Duration(milliseconds: 300);
          if (state.index == 0) {
            Scrollable.ensureVisible(
              introKey.currentContext!,
              duration: duration,
            );
          }
          if (state.index == 1) {
            Scrollable.ensureVisible(
              aboutKey.currentContext!,
              duration: duration,
            );
          }
          if (state.index == 2) {
            Scrollable.ensureVisible(
              contactKey.currentContext!,
              duration: duration,
            );
          }
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .08),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  IntroSection(key: introKey),
                  AboutMeSection(key: aboutKey),
                  ContactSection(key: contactKey),
                ],
              ),
            ),
          ),
          const VerticalHeadersBuilder(),
        ],
      ),
    );
  }
}
