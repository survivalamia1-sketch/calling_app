// Conditional import: use dart:io on non-web, stub on web
import 'dart:io'
    if (dart.library.html) 'package:calling_app/core/utils/platform_helper_stub.dart';

import 'package:flutter/foundation.dart';

/// Platform detection helper that works on all platforms including web
class PlatformHelper {
  /// Check if running on Android
  static bool get isAndroid {
    if (kIsWeb) return false;
    // ignore: undefined_class, undefined_getter
    return Platform.isAndroid;
  }

  /// Check if running on iOS
  static bool get isIOS {
    if (kIsWeb) return false;
    // ignore: undefined_class, undefined_getter
    return Platform.isIOS;
  }

  /// Check if running on macOS
  static bool get isMacOS {
    if (kIsWeb) return false;
    // ignore: undefined_class, undefined_getter
    return Platform.isMacOS;
  }

  /// Check if running on a mobile platform (Android or iOS)
  static bool get isMobile {
    if (kIsWeb) return false;
    // ignore: undefined_class, undefined_getter
    return Platform.isAndroid || Platform.isIOS;
  }

  /// Check if running on a desktop platform (Windows, Linux, macOS)
  static bool get isDesktop {
    if (kIsWeb) return false;
    // ignore: undefined_class, undefined_getter
    return !Platform.isAndroid && !Platform.isIOS;
  }
}
