import 'dart:io';

import 'package:flutter/foundation.dart';

/// In-memory profile state shared between the profile header and the
/// edit-profile screen. Replace with a real data source when the backend
/// is wired up.
abstract class ProfileData {
  static final ValueNotifier<String> name = ValueNotifier(
    'Mahmoud Elsebaei',
  );
  static final ValueNotifier<String> email = ValueNotifier(
    'mahmoudelsebaei@trendiva.com',
  );
  static final ValueNotifier<File?> photo = ValueNotifier(null);
}
