import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class PermissionsHelper {
  /// Request camera and microphone permissions for video calls
  static Future<bool> requestCallPermissions() async {
    // For web, permissions are handled by the browser
    if (!Platform.isAndroid && !Platform.isIOS && !Platform.isMacOS) {
      return true;
    }

    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    // Check if all permissions are granted
    bool allGranted = statuses.values.every(
      (status) => status.isGranted,
    );

    return allGranted;
  }

  /// Check if call permissions are already granted
  static Future<bool> hasCallPermissions() async {
    if (!Platform.isAndroid && !Platform.isIOS && !Platform.isMacOS) {
      return true;
    }

    bool cameraGranted = await Permission.camera.isGranted;
    bool microphoneGranted = await Permission.microphone.isGranted;

    return cameraGranted && microphoneGranted;
  }

  /// Request storage permission for file uploads (Android only)
  static Future<bool> requestStoragePermission() async {
    if (!Platform.isAndroid) {
      return true;
    }

    // For Android 13+, use photos permission
    if (Platform.isAndroid) {
      final status = await Permission.photos.request();
      if (status.isGranted) {
        return true;
      }

      // Fallback to storage for older Android versions
      final storageStatus = await Permission.storage.request();
      return storageStatus.isGranted;
    }

    return true;
  }

  /// Open app settings if permissions are permanently denied
  static Future<void> openAppSettings() async {
    await openAppSettings();
  }

  /// Check and request all necessary permissions
  static Future<Map<String, bool>> checkAllPermissions() async {
    final results = <String, bool>{};

    if (!Platform.isAndroid && !Platform.isIOS && !Platform.isMacOS) {
      // Web and desktop (except macOS) don't need explicit permission checks
      return {
        'camera': true,
        'microphone': true,
        'storage': true,
      };
    }

    results['camera'] = await Permission.camera.isGranted;
    results['microphone'] = await Permission.microphone.isGranted;

    if (Platform.isAndroid) {
      results['storage'] = await Permission.storage.isGranted ||
          await Permission.photos.isGranted;
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
    required Permission permission,
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
