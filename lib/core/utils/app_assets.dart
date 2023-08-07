const _imageBasePath = 'assets/images';
const _lottieBasePath = 'assets/lottie';

abstract class AppAssets {
  static const devImg = '$_imageBasePath/my_image.png';
}

abstract class AppLottie {
  static const linux = '$_lottieBasePath/linux.json';
  static const mobile = '$_lottieBasePath/mobile.json';
  static const web = '$_lottieBasePath/web.json';
}
