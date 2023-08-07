import '../../data/models/custom_service.dart';
import 'app_assets.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const List<CustomService> services = [
    CustomService(
      service: 'MOBILE DEVELOPMENT',
      logo: AppLottie.mobile,
      description: 'I am a Mid mobile developer. I have experience using Dart and Flutter Framework.',
    ),
    CustomService(
      service: 'WEB DEVELOPMENT',
      logo: AppLottie.web,
      description: 'I develop web apps with Flutter. This portfolio app was also developed using FLutter.',
    ),
    CustomService(
      service: 'LINUX DEVELOPMENT',
      logo: AppLottie.linux,
      description:
          'I also have experience developing applications for Linux platform. I developed an application using flutter-pi(A custom flutter engine for raspberry pi.)',
    ),
  ];
}
