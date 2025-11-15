import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

import 'platform_helper.dart';

class PermissionsHelper {
  /// Request camera and microphone permissions for video calls
  static Future<bool> requestCallPermissions() async {
    // For web, permissions are handled by the browser
    if (kIsWeb) {
      return true;
    }

    // For non-web platforms, check if it's a mobile/desktop platform
    if (!PlatformHelper.isAndroid &&
        !PlatformHelper.isIOS &&
        !PlatformHelper.isMacOS) {
      return true;
    }

    Map<permission_handler.Permission, permission_handler.PermissionStatus>
        statuses = await [
      permission_handler.Permission.camera,
      permission_handler.Permission.microphone,
    ].request();

    // Check if all permissions are granted
    bool allGranted = statuses.values.every(
      (status) => status.isGranted,
    );

    return allGranted;
  }

  /// Check if call permissions are already granted
  static Future<bool> hasCallPermissions() async {
    // For web, permissions are handled by the browser
    if (kIsWeb) {
      return true;
    }

    if (!PlatformHelper.isAndroid &&
        !PlatformHelper.isIOS &&
        !PlatformHelper.isMacOS) {
      return true;
    }

    bool cameraGranted = await permission_handler.Permission.camera.isGranted;
    bool microphoneGranted =
        await permission_handler.Permission.microphone.isGranted;

    return cameraGranted && microphoneGranted;
  }

  /// Request storage permission for file uploads (Android only)
  static Future<bool> requestStoragePermission() async {
    // For web, permissions are handled by the browser
    if (kIsWeb) {
      return true;
    }

    if (!PlatformHelper.isAndroid) {
      return true;
    }

    // For Android 13+, use photos permission
    if (PlatformHelper.isAndroid) {
      final status = await permission_handler.Permission.photos.request();
      if (status.isGranted) {
        return true;
      }

      // Fallback to storage for older Android versions
      final storageStatus =
          await permission_handler.Permission.storage.request();
      return storageStatus.isGranted;
    }

    return true;
  }

  /// Open app settings if permissions are permanently denied
  static Future<void> openAppSettings() async {
    // For web, settings are handled by the browser
    if (kIsWeb) {
      return;
    }
    await permission_handler.openAppSettings();
  }

  /// Check and request all necessary permissions
  static Future<Map<String, bool>> checkAllPermissions() async {
    final results = <String, bool>{};

    // For web, permissions are handled by the browser
    if (kIsWeb) {
      return {
        'camera': true,
        'microphone': true,
        'storage': true,
      };
    }

    if (!PlatformHelper.isAndroid &&
        !PlatformHelper.isIOS &&
        !PlatformHelper.isMacOS) {
      // Desktop (except macOS) don't need explicit permission checks
      return {
        'camera': true,
        'microphone': true,
        'storage': true,
      };
    }

    results['camera'] = await permission_handler.Permission.camera.isGranted;
    results['microphone'] =
        await permission_handler.Permission.microphone.isGranted;

    if (PlatformHelper.isAndroid) {
      results['storage'] =
          await permission_handler.Permission.storage.isGranted ||
              await permission_handler.Permission.photos.isGranted;
    } else {
      results['storage'] = true;
    }

    return results;
  }

  /// Show a dialog explaining why permissions are needed
  static String getPermissionRationale(String permissionType) {
    switch (permissionType) {
      case 'camera':
        return 'Camera access is required for video calls. Please grant camera permission to use video calling features.';
      case 'microphone':
        return 'Microphone access is required for audio in calls. Please grant microphone permission to communicate in calls.';
      case 'storage':
        return 'Storage access is required to select and upload profile pictures.';
      default:
        return 'This permission is required for the app to function properly.';
    }
  }

  /// Request permission with user-friendly handling
  static Future<bool> requestPermissionWithRationale({
    required permission_handler.Permission permission,
    required String permissionName,
  }) async {
    final status = await permission.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      final result = await permission.request();
      return result.isGranted;
    }

    if (status.isPermanentlyDenied) {
      // Show dialog to open settings
      return false;
    }

    return false;
  }
}
