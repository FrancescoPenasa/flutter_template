import 'src/services/locator.dart';
import 'src/services/logger.dart';

// ========================================================================= //
// =========================== android constants =========================== //
// ========================================================================= //

// text size
const double _tm = 10.0; // micro
const double _ts = 12.0; // small
const double _t = 16.0; // medium
const double _tl = 18.0; // large
const double _tt = 24.0; // title

// action bar height
const double _abp = 48.0; // portrait
const double _abl = 40.0; // landscape
const double _abt = 56.0; // tablet

// navigation bar height
const double _hnb = 48.0;

// space
const double _space = 8.0; // spacing


// ========================================================================= //
// =========================== project constants =========================== //
// ========================================================================= //

// k + type + notes
final Logger logger = serviceLocator.get<Logger>();
const kDebugMode = true; // release == false
const kBuildVersion = 0; // release update


// ========================================================================= //
// ================================ padding ================================ //
// ========================================================================= //
const kPaddingBase = _space; // 8.0
const kPaddingXS = 14.0;
const kPaddingS = 18.0;
const kPaddingM = 21.0;
const kPaddingL = 30.0;
const kPaddingXL = 36.0;
const kPadding2XL = 72.0;
const kPadding3XL = 108.0;
const kPadding4XL = 144.0;
const kPadding5XL = 170.0;
const kPadding6XL = 200.0;


// ========================================================================= //

// ========================================================================= //
// ================================= sizes ================================= //
// ========================================================================= //

const double toolbarHeight = 100.0;

// ========================================================================= //