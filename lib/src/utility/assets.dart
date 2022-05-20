// ignore_for_file: non_constant_identifier_names

import '../../constants.dart';

/// All assets are stored here.
class R {
  static Strings strings = Strings();
  static SVGImages svgImages = SVGImages();
  static PNGImages pngImages = PNGImages();
  static JPGImages jpgImages = JPGImages();
  static LottieFiles lottieFiles = LottieFiles();
}

class Strings {
  final String TITLE = "TITOLO";

  final String _URL = kDebugMode
      ? 'https://development.it'
      : 'https://production.it';

  late final String _API;
  late final String _LOGIN;

  late final Uri URI_LOGIN;

  Strings() {
    _API = "$_URL/api/v1";
    _LOGIN = "$_API/login";

    URI_LOGIN = Uri.parse(_LOGIN);
  }


}

class SVGImages {
}

class PNGImages {
  String test = "assets/images/png/test.png";
}

class JPGImages {
  String test = "assets/images/jpg/test.jpg";
}

class LottieFiles {
  // String paperPlane = "https://raw.githubusercontent.com/erluxman/awesomefluttertips/master/assets/lottie/paper_plane.json";
}
