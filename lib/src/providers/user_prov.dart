import 'package:flutter/foundation.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User user = User();
}
