// ignore_for_file: non_constant_identifier_names

class R {
  static Strings strings = Strings();
  static SVGImages svgImages = SVGImages();
  static PNGImages pngImages = PNGImages();
  static JPGImages jpgImages = JPGImages();
  static LottieFiles lottieFiles = LottieFiles();
}

class Strings {
  final String _title = "TITLE";

  String get title => _title;
}

class SVGImages {
  // final String bg_login = "assets/images/svg/login_background.svg";
}

class PNGImages {
  final String test = "assets/images/png/test.png";
}

class JPGImages {
  final String test = "assets/images/jpg/test.jpg";
}

class LottieFiles {
  // String paperPlane = "https://raw.githubusercontent.com/erluxman/awesomefluttertips/master/assets/lottie/paper_plane.json";
}
