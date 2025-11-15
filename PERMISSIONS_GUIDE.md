# WebRTC Permissions Configuration Guide

This document explains all the permissions configured for the Video Calling app across all platforms to ensure WebRTC functionality works correctly.

---

## 📱 Android Permissions

### Location: `android/app/src/main/AndroidManifest.xml`

### Configured Permissions:

```xml
<!-- Core WebRTC Permissions -->
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />

<!-- Bluetooth for audio routing -->
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />

<!-- Keep device awake during calls -->
<uses-permission android:name="android.permission.WAKE_LOCK" />

<!-- Storage for profile pictures -->
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

### Feature Requirements:

```xml
<uses-feature android:name="android.hardware.camera" android:required="false" />
<uses-feature android:name="android.hardware.camera.autofocus" android:required="false" />
<uses-feature android:name="android.hardware.microphone" android:required="true" />
```

### Why Each Permission is Needed:

| Permission | Purpose |
|------------|---------|
| `CAMERA` | Access device camera for video calls |
| `RECORD_AUDIO` | Access microphone for audio in calls |
| `INTERNET` | Connect to signaling server and peers |
| `ACCESS_NETWORK_STATE` | Check network connectivity |
| `MODIFY_AUDIO_SETTINGS` | Adjust audio settings during calls |
| `BLUETOOTH` | Route audio to Bluetooth devices |
| `BLUETOOTH_CONNECT` | Connect to Bluetooth audio devices (Android 12+) |
| `WAKE_LOCK` | Keep screen on during active calls |
| `WRITE/READ_EXTERNAL_STORAGE` | Upload/select profile pictures |

---

## 🍎 iOS Permissions

### Location: `ios/Runner/Info.plist`

### Configured Permission Descriptions:

```xml
<!-- WebRTC Permissions -->
<key>NSCameraUsageDescription</key>
<string>This app needs access to your camera for video calls</string>

<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to your microphone for audio calls</string>

<!-- Photo Library for Profile Pictures -->
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs access to your photo library to update your profile picture</string>

<key>NSPhotoLibraryAddUsageDescription</key>
<string>This app needs permission to save photos to your library</string>

<!-- Local Network for WebRTC -->
<key>NSLocalNetworkUsageDescription</key>
<string>This app needs access to local network for peer-to-peer video calls</string>

<key>NSBonjourServices</key>
<array>
    <string>_services._dns-sd._udp.</string>
</array>
```

### Why Each Description is Needed:

| Permission Key | Purpose |
|----------------|---------|
| `NSCameraUsageDescription` | Required for camera access (mandatory on iOS) |
| `NSMicrophoneUsageDescription` | Required for microphone access (mandatory on iOS) |
| `NSPhotoLibraryUsageDescription` | Access photos for profile picture upload |
| `NSPhotoLibraryAddUsageDescription` | Save photos to library |
| `NSLocalNetworkUsageDescription` | P2P connections for WebRTC (iOS 14+) |
| `NSBonjourServices` | Network service discovery for local connections |

---

## 💻 macOS Permissions

### Locations:
- `macos/Runner/Info.plist`
- `macos/Runner/DebugProfile.entitlements`
- `macos/Runner/Release.entitlements`

### Info.plist Descriptions:

```xml
<!-- WebRTC Permissions -->
<key>NSCameraUsageDescription</key>
<string>This app needs access to your camera for video calls</string>

<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to your microphone for audio calls</string>

<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs access to your photo library to update your profile picture</string>
```

### Entitlements (Both Debug and Release):

```xml
<!-- App Sandbox -->
<key>com.apple.security.app-sandbox</key>
<true/>

<!-- Network Access -->
<key>com.apple.security.network.client</key>
<true/>
<key>com.apple.security.network.server</key>
<true/>

<!-- Hardware Access -->
<key>com.apple.security.device.camera</key>
<true/>
<key>com.apple.security.device.microphone</key>
<true/>
<key>com.apple.security.device.audio-input</key>
<true/>

<!-- File Access -->
<key>com.apple.security.files.user-selected.read-write</key>
<true/>
```

### Why Each Entitlement is Needed:

| Entitlement | Purpose |
|-------------|---------|
| `app-sandbox` | Enable macOS sandboxing (required) |
| `network.client` | Make outgoing network connections |
| `network.server` | Accept incoming WebRTC connections |
| `device.camera` | Access camera hardware |
| `device.microphone` | Access microphone hardware |
| `device.audio-input` | Access audio input |
| `files.user-selected.read-write` | Access user-selected files |

---

## 🌐 Web Platform

### Location: `web/index.html`

### How Permissions Work:

**No configuration needed!** Web browsers handle WebRTC permissions automatically:

1. **Camera Permission**: Browser prompts user when `getUserMedia()` is called
2. **Microphone Permission**: Browser prompts user when audio is requested
3. **HTTPS Required**: WebRTC only works over HTTPS (except localhost)

### Browser Compatibility:

| Browser | WebRTC Support | Notes |
|---------|---------------|-------|
| Chrome/Edge | ✅ Full | Best support |
| Firefox | ✅ Full | Excellent support |
| Safari | ✅ Good | iOS 11+ required |
| Opera | ✅ Full | Chromium-based |

### Requirements for Production:

1. **HTTPS**: Must be served over HTTPS
2. **Valid Certificate**: No self-signed certs in production
3. **Secure Context**: Camera/mic only work in secure contexts

---

## 🪟 Windows Platform

### Location: `windows/runner/`

### How Permissions Work:

**No special configuration needed!** Windows handles permissions through the OS:

1. **Camera**: Windows prompts user on first camera access
2. **Microphone**: Windows prompts user on first microphone access
3. **Settings**: Users can manage in Windows Settings > Privacy

### Requirements:

- Windows 10 version 1809 or higher recommended
- Camera and microphone drivers must be installed
- Privacy settings must allow app access

---

## 🐧 Linux Platform

### How Permissions Work:

**No special configuration needed!** Permissions are handled by the system:

1. **Camera/Microphone**: Accessed through system APIs
2. **PulseAudio/ALSA**: Audio handled by system sound server
3. **V4L2**: Video handled by Video4Linux2 API

### Requirements:

- Working camera driver (V4L2)
- PulseAudio or ALSA for audio
- Proper device permissions (`/dev/video*`, `/dev/snd/*`)

---

## 🔧 Runtime Permission Handling

### Helper Class: `PermissionsHelper`

Location: `lib/core/utils/permissions_helper.dart`

### Key Methods:

```dart
// Request camera and microphone permissions
await PermissionsHelper.requestCallPermissions();

// Check if permissions are already granted
await PermissionsHelper.hasCallPermissions();

// Request storage permission (Android only)
await PermissionsHelper.requestStoragePermission();

// Open app settings if denied
await PermissionsHelper.openAppSettings();

// Get all permission statuses
await PermissionsHelper.checkAllPermissions();
```

### Usage in CallPage:

The `CallPage` automatically requests permissions before joining a call:

```dart
Future<void> _requestPermissionsAndJoinCall() async {
  final granted = await PermissionsHelper.requestCallPermissions();

  if (!granted) {
    _showPermissionDeniedDialog();
    return;
  }

  // Join call
  context.read<CallBloc>().add(CallEvent.joinCall(roomId: widget.roomId));
}
```

---

## ✅ Testing Checklist

### Android Testing:
- [ ] Camera permission prompt appears
- [ ] Microphone permission prompt appears
- [ ] Bluetooth audio routing works
- [ ] Camera switches between front/back
- [ ] App works after denying and re-granting permissions
- [ ] Storage permission for profile picture upload

### iOS Testing:
- [ ] Camera permission prompt appears
- [ ] Microphone permission prompt appears
- [ ] Local network permission prompt (iOS 14+)
- [ ] Camera switches between front/back
- [ ] App handles denied permissions gracefully
- [ ] Photo library access for profile pictures

### macOS Testing:
- [ ] Camera permission prompt appears
- [ ] Microphone permission prompt appears
- [ ] System Preferences shows app in Privacy settings
- [ ] App works in sandboxed environment
- [ ] File selection works for profile pictures

### Web Testing:
- [ ] Browser permission prompt appears (camera)
- [ ] Browser permission prompt appears (microphone)
- [ ] HTTPS connection works
- [ ] Localhost testing works
- [ ] Permissions persist after grant

### Windows Testing:
- [ ] Windows permission prompt appears
- [ ] Camera selection works
- [ ] Microphone selection works
- [ ] Privacy settings integration

---

## 🚨 Common Issues and Solutions

### Issue: Camera/Microphone not working on Android

**Solution:**
1. Check `AndroidManifest.xml` has all required permissions
2. Ensure app requests permissions at runtime
3. Verify device has working camera/microphone
4. Check Android version (API 21+ required)

### Issue: iOS permissions denied permanently

**Solution:**
1. Use `PermissionsHelper.openAppSettings()`
2. Guide user to Settings > Privacy > Camera/Microphone
3. Have user enable permissions manually

### Issue: macOS sandbox blocks camera

**Solution:**
1. Verify entitlements files have camera/microphone enabled
2. Check `Info.plist` has usage descriptions
3. Sign app properly for distribution

### Issue: Web camera not working

**Solution:**
1. Ensure site is served over HTTPS
2. Check browser console for errors
3. Verify browser supports WebRTC
4. Check browser permissions (camera icon in address bar)

### Issue: Permission prompt not appearing

**Solution:**
1. Clear app data/cache
2. Reinstall app
3. Check permission is not already denied
4. Verify permission_handler package is configured correctly

---

## 📚 Additional Resources

### Official Documentation:
- [Flutter WebRTC](https://pub.dev/packages/flutter_webrtc)
- [Permission Handler](https://pub.dev/packages/permission_handler)
- [Android Permissions](https://developer.android.com/guide/topics/permissions/overview)
- [iOS Privacy](https://developer.apple.com/documentation/uikit/protecting_the_user_s_privacy)
- [macOS Entitlements](https://developer.apple.com/documentation/bundleresources/entitlements)

### WebRTC Resources:
- [WebRTC.org](https://webrtc.org/)
- [MDN WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API)
- [getUserMedia Docs](https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia)

---

## 🔐 Privacy & Security

### Best Practices:

1. **Request permissions only when needed**
   - Don't request all permissions on app start
   - Request when user tries to use feature

2. **Explain why permissions are needed**
   - Show clear dialogs before requesting
   - Use descriptive permission messages

3. **Handle denials gracefully**
   - Provide alternative flows
   - Allow app to function with limited permissions

4. **Respect user privacy**
   - Never access camera/microphone without user knowing
   - Provide clear indicators when camera/mic is active
   - Allow users to revoke permissions easily

---

## 📝 Summary

All platforms are now properly configured for WebRTC video calling:

✅ **Android** - All permissions added to AndroidManifest.xml
✅ **iOS** - All usage descriptions added to Info.plist
✅ **macOS** - Entitlements and usage descriptions configured
✅ **Web** - Browser handles permissions automatically
✅ **Windows** - OS handles permissions automatically
✅ **Linux** - System handles permissions automatically

The app will now correctly request and handle permissions for camera and microphone access on all platforms!
